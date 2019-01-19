class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :company
      t.string :phone
      t.string :address
      t.string :website
      t.references :group, foreign_key: true

      t.timestamps
    end
  end
end
