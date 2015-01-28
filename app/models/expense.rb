class Expense < ActiveRecord::Base
  belongs_to :department
  belongs_to :location

  def self.collection_cache_key
    latest         = order('updated_at DESC').take
    max_updated_at = [latest.updated_at, latest.location.updated_at].max
                     .try(:utc).try(:to_s, :number)
    [count,max_updated_at].join('-')
  end
end
