class CreateJourneys < ActiveRecord::Migration
  def change
    create_table :journeys do |t|

      t.string :title
      t.string :location
      t.string :short_description
      t.text :long_description

      t.string :duration
      t.string :duration_comments

      t.datetime :date
      t.string :text_date

      t.references :user


      t.timestamps
    end
  end
end
