class CreateUserBirds < ActiveRecord::Migration[5.2]
  def change
    create_table :user_birds do |t|
      t.references :user, foreign_key: true
      t.references :data_base_bird, foreign_key: true
    end
  end
end
