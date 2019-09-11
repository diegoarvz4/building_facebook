class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :country
      t.string :city
      t.datetime :birthdate
      t.string :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
