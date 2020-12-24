# frozen_string_literal: true

class Post < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
  validates :is_publish, inclusion: { in: [true, false] }

  belongs_to :user
  has_many :comments, dependent: :destroy
end
