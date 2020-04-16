class IndexRenameCarModel < ActiveRecord::Migration[6.0]
  def change
    rename_column :car_models, :carcategory_id, :car_category_id
  end
end
