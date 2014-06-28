class AddsDescriptionToUsers < ActiveRecord::Migration
  def change
    add_column :users, :description, :text, after: :name
  end
end
