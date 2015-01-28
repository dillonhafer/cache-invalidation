module CollectionCacheKey
  extend ActiveSupport::Concern

  module ClassMethods
    def collection_cache_key
      max_updated_at = maximum(:updated_at).try(:utc).try(:to_s, :number)
      [count,max_updated_at].join('-')
    end
  end
end

ActiveRecord::Base.send(:include, CollectionCacheKey)
