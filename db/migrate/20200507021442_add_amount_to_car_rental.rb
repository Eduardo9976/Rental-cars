class AddAmountToCarRental < ActiveRecord::Migration[6.0]
  def change
    add_column :car_rentals, :amount, :decimal
  end
end
