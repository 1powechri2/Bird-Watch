class CreateDataBaseBirds < ActiveRecord::Migration[5.2]
  def change
    create_table :data_base_birds do |t|
      t.string :comName
      t.string :sciName
      t.string :locName
      t.string :obsDt
      t.integer :lat
      t.integer :lng
      t.boolean :locationPrivate
    end
  end
end
