class List < ApplicationRecord
  belongs_to :user
  has_many :bookmarks, dependent: :destroy
  has_many :movies, through: :bookmarks
  has_many :reviews, dependent: :destroy

  validates :name, uniqueness: true, presence: true
  acts_as_favoritable
end
