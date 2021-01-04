class CreateStamps < ActiveRecord::Migration[6.0]
  def change
    create_table :stamps do |t|
      t.string :name,       null: false
      t.references :album,  foreign_key: true
      t.date  :visit_day,   null: false
      t.timestamps
    end
  end
end
