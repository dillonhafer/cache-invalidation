module DepartmentsHelper
  def bia_cache_key_for(relationship)
    collection_cache_key = @department.send(relationship).collection_cache_key
    "dept/#{@department.id}/#{relationship}/all-#{collection_cache_key}"
  end
end
