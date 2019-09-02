class Post < ApplicationRecord
  default_scope { order(created_at: :desc) }
  belongs_to :author, class_name: 'User'
  has_many :comments
  validates :content, presence: true
end
