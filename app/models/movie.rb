class Movie < ApplicationRecord
  has_many :bookmarks
  validates :title, uniqueness: true
  validates :title, presence: true
  validates :overview, presence: true
  acts_as_favoritable
end
