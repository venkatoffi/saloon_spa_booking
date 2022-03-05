class CreateServices < ActiveRecord::Migration[7.0]
  def change
    create_table :services do |t|
      t.references :company, null: false, foreign_key: true
      t.string :name
      t.string :duration
      t.integer :price

      t.timestamps
    end
  end
end
