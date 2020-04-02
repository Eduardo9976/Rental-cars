class CreateFiats < ActiveRecord::Migration[6.0]
  def change
    create_table :fiats do |t|

      t.timestamps
    end
  end
end
