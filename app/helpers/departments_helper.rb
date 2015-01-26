module DepartmentsHelper
  def bia_cache_key_for(relationship)
    count          = @department.send(relationship).count
    max_updated_at = @department.send(relationship).maximum(:updated_at).try(:utc).try(:to_s, :number)
    "dept/#{@department.id}/#{relationship}/all-#{count}-#{max_updated_at}"
  end
end
