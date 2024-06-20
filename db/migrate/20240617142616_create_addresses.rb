class CreateAddresses < ActiveRecord::Migration[7.1]
  def change
    create_table :addresses do |t|
      t.references :user, null: false, foreign_key: true
      t.string :street
      t.string :suite
      t.string :city
      t.string :zipcode
      t.string :lat
      t.string :lng

      t.timestamps
    end
  end
end
