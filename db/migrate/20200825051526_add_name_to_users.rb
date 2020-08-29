class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :name, :string
    add_column :users, :introduction, :text
    add_column :users, :objective, :string
  end
end
