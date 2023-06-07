class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :release_date, :updated_at
  has_many :comments
end
