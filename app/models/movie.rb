class Movie < ApplicationRecord
  has_many :bookmarks
  has_many :lists, through: :bookmarks
  has_many :reviews

  validates :title, presence: true, uniqueness: true
  validates :overview, presence: true
end
