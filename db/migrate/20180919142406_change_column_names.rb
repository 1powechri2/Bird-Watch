class ChangeColumnNames < ActiveRecord::Migration[5.2]
  def change
   rename_column :data_base_birds, :comName, :common_name
   rename_column :data_base_birds, :sciName, :scientific_name
   rename_column :data_base_birds, :locName, :location
   rename_column :data_base_birds, :obsDt, :observation_date
   rename_column :data_base_birds, :lng, :long
   rename_column :data_base_birds, :locationPrivate, :private
  end
end
