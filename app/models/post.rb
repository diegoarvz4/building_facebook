class Post < ApplicationRecord
  default_scope { order(created_at: :desc) }
  belongs_to :author, class_name: 'User'
  validates :content, presence: true
end
