class Article < ApplicationRecord
  before_create :add_release_date
  validates :title, presence: true
  validates :body, presence: true
  has_many :comments, dependent: :destroy
  scope :page, ->(page_number) { Article.limit(3).offset((page_number - 1) * 3) }
  scope :comment_page, lambda { |article_id, page_number|
                         Article.find(article_id).comments.limit(3).offset((page_number - 1) * 3)
                       }
  scope :search, ->(title) { Article.includes(:comments).where('title like ?', "#{title}%") }
  scope :comment_search, lambda { |article_id, comment|
                           Article.find(article_id).comments.where('comment like ? ', "#{comment}%")
                         }

  private

  def add_release_date
    self.release_date = Date.today
  end
end
