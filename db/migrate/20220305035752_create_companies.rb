class CreateCompanies < ActiveRecord::Migration[7.0]
  def change
    create_table :companies do |t|
      t.string :name, null: false
      t.integer :gst_in, null: false
      t.integer :pan, null: false
      t.string :address
      t.integer :chairs
      t.json :working_hours
      
      t.timestamps
    end
  end
end
