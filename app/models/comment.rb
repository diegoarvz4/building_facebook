# frozen_string_literal:true

class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  default_scope -> { order(created_at: :desc) }
  validates :content, presence: true
end
