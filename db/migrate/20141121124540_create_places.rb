class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|

      t.string :name, null: false
      t.string :short_descriptipn
      t.text :description

      t.float :latitude
      t.float :longitude

      t.attachment :cover

      t.timestamps
    end
  end
end
