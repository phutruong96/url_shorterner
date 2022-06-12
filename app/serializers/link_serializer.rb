class LinkSerializer < ActiveModel::Serializer
  attributes :id, :url, :short, :clicked
end
