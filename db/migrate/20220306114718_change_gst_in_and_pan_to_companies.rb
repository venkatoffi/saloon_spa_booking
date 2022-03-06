class ChangeGstInAndPanToCompanies < ActiveRecord::Migration[7.0]
  def change
    change_column :companies, :gst_in, :string
    change_column :companies, :pan, :string
  end
end
