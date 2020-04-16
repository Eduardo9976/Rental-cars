class RenameDialyrateToDailyRate < ActiveRecord::Migration[6.0]
  def change
    rename_column :car_categories, :dialyrate, :daily_rate
  end
end
