class RemoveReviewFromMovies < ActiveRecord::Migration[7.1]
  def change
    remove_column :movies, :review
  end
end
