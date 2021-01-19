class Post < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :votes, as: :votable, dependent: :destroy
  validates :title, presence: true, length: { minimum: 5 }
end
