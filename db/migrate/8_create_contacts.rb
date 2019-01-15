class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :number, null: false
      t.string :email
      t.boolean :active, default: true

      t.timestamps
    end
    add_reference :contacts, :user, null: false
    add_index :contacts, %i[user_id number], unique: true
  end
end
