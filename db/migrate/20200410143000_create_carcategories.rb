class CreateCarcategories < ActiveRecord::Migration[6.0]
  def change
    create_table :carcategories do |t|
      t.string :name
      t.decimal :dialyrate
      t.decimal :insurance
      t.decimal :thirdinsurance

      t.timestamps
    end
  end
end
