class CreateDataBaseBirds < ActiveRecord::Migration[5.2]
  def change
    create_table :data_base_birds do |t|
      t.string :comName
      t.string :sciName
      t.string :locName
      t.string :obsDt
      t.string :lat
      t.string :lng
      t.boolean :locationPrivate
    end
  end
end
