class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :release_date, :updated_at
end
