class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email, index: {unique: true}
      t.string :password_digest
      t.date :date_of_birth
      t.string :role
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
