class AddCategoryToBooks < ActiveRecord::Migration[8.1]
  def change
    add_column :books, :category, :string
  end
end
