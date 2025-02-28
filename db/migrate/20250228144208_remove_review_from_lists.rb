class RemoveReviewFromLists < ActiveRecord::Migration[7.1]
  def change
    remove_column :lists, :review
  end
end
