class Vote < ApplicationRecord
  belongs_to :votable, polymorphic: true
  has_many :votes, as: :votable, dependent: :destroy
end
