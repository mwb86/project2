class Gym < ApplicationRecord
  has_many :posts
  has_many :users
  validates :name, presence: true, length: { minimum: 5}
  validates :body, presence: true
end
