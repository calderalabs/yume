class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.string :location
      t.datetime :starts_at
      t.datetime :ends_at
      t.string :image

      t.timestamps
    end
  end
end
