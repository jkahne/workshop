class Post < ApplicationRecord
  validates :title, presence: true
  validates :popularity, numericality: {greater_than: 5}

  has_many :comments, dependent: :delete_all

  before_validation do |post|
    DbLogger.create(loggable_id: post.id, loggable_name: 'Post', action: 'before_validation', msg: "my popularity is #{post.popularity}")
    normalize_popularity if low_popularity? #yes this is bypassing the validation on popularity.
  end
  after_validation do |post|
    DbLogger.create(loggable_id: post.id, loggable_name: 'Post', action: 'after_validation', msg: "my popularity is #{post.popularity}")
  end
  after_save do |post|
    DbLogger.create(loggable_id: post.id, loggable_name: 'Post', action: 'created', msg: 'additional stuff')
  end
  after_update do |post|
    DbLogger.create(loggable_id: post.id, loggable_name: 'Post', action: 'update', msg: 'additional stuff')
  end


  def low_popularity?
    popularity <= 5
  end

  def normalize_popularity
    self.popularity = self.popularity + 20
  end
end
