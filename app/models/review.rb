class Review < ApplicationRecord
  belongs_to :movie

  validates :content, presence: true
  validates :movie_id, presence: true
end
