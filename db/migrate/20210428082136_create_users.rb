class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :surname,            null: false
      t.string :name,               null: false
      t.string :patronymic
      t.date :date_employment,      null: false
      t.string :phone
      t.string :login,              null: false
      t.belongs_to :position, null: false, foreign_key: true

      t.timestamps
    end
  end
end
