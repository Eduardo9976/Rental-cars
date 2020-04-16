class RenameCarcategoryToCarCategory < ActiveRecord::Migration[6.0]
  def change
    rename_table :carcategories, :car_categories
  end
end
