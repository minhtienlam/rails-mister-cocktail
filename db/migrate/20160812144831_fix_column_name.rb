class FixColumnName < ActiveRecord::Migration[5.0]
  def change
    rename_column :doses, :descritpion, :description
  end
end
