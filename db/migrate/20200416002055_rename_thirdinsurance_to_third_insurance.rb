class RenameThirdinsuranceToThirdInsurance < ActiveRecord::Migration[6.0]
  def change
    rename_column :car_categories, :thirdinsurance, :third_insurance
  end
end
