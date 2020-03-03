class Comment < ApplicationRecord
  belongs_to :post

  validates :body, length: {minimum: 10}
end
