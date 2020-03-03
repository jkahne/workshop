class Post < ApplicationRecord
  validates :title, presence: true
  validates :popularity, numericality: {greater_than: 5}

  has_many :comments, dependent: :delete_all
end
