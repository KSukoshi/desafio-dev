class CreatePaymentMethods < ActiveRecord::Migration[7.1]
  def change
    create_table :payment_methods do |t|
      t.string :payment_description
      t.string :payment_type

      t.timestamps
    end
  end
end
