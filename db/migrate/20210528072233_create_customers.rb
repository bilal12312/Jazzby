class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :cnic
      t.string :phone
      t.string :email
      

      t.timestamps
    end
  end
end
