class AddStarToBooks < ActiveRecord::Migration[8.1]
  def change
    add_column :books, :star, :string
  end
end
