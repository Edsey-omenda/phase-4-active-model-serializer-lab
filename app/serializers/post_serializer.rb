class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :short_content

  belongs_to :author
  has_many   :tags
end
