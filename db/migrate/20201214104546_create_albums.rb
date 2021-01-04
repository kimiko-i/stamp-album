class CreateAlbums < ActiveRecord::Migration[6.0]
  def change
    create_table :albums do |t|
      t.text :image, null: false
      t.string :category, null: false
      t.timestamps
    end
  end
end
