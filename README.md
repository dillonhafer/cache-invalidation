## Context

We have a show page for a model (**Department**). That model has several has_many relationships (**Item**) that get showed on the model's show page,
like a dashboard. The has_many relationships are rendered by two levels of partials which each are cached: an index
partial for each relationship that loops through the related items, and the show partial for each individual related items.
These related items (**Item**) also belongs_to another another model (**Location**).

## Problem

We have an issue where a name change on a related item's belongs_to (**Location**) doesn’t get displayed on the **Department**’s show page.
This is due to the cache keys at the index level. How do we allow updated information to propagate from the **Item**'s other belongs_to
model (**Location**) to the **Department**'s show page so that it is displayed? We are always mindful of performance.

As we look at our cache key, we notice it's based on the maximum updated time of our **Item** model, and we take no account for its other
relationships.

```ruby
def bia_cache_key_for(type)
  count          = @department.send(type).count
  max_updated_at = @department.send(type).maximum(:updated_at).try(:utc).try(:to_s, :number)
  ".../dept/#{@department.id}/#{...}/#{type}/all-#{count}-#{max_updated_at}"
end
```

## Solution

We need to rewrite the way we calculate cache keys. In this instance the many has_many relationships can get by using this cache key.
There's only one model (**Item**) that includes its **Location**, so we really only need this cache key to be different for one
model (**Item**).

First, let's give every model a method they can use to determine their default cache key.

```ruby
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
```

With all of our models now able to use this ```collection_cache_key``` method, we can update our helper method like so:

```ruby
def bia_cache_key_for(relationship)
  collection_cache_key = @department.send(relationship).collection_cache_key
  ".../dept/#{@department.id}/#{...}/#{type}/all-#{collection_cache_key}"
end
```
