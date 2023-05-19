class Article < ApplicationRecord
  before_create :add_release_date
  validates :title, presence: true
  validates :body, presence: true
  scope :get_article_page, ->(page_number) { Article.limit(3).offset((page_number - 1) * 3) }

  private

  def add_release_date
    self.release_date = Date.today
  end
end
