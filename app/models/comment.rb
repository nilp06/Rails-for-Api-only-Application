class Comment < ApplicationRecord
  belongs_to :article

  before_create :add_date_of_comment

  private

  def add_date_of_comment
    self.date_of_comment = Date.today
  end
end
