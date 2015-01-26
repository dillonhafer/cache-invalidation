module DepartmentsHelper
  def cache_key_for_products
    count          = Product.count
    max_updated_at = Product.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "products/all-#{count}-#{max_updated_at}"
  end

  def bia_cache_key_for(type)
    count          = @department.send(type).count
    max_updated_at = @department.send(type).maximum(:updated_at).try(:utc).try(:to_s, :number)
    "dept/#{@department.id}/#{type}/all-#{count}-#{max_updated_at}"
  end
end
