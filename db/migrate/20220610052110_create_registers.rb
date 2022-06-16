class CreateRegisters < ActiveRecord::Migration[7.0]
  def change
    create_table :registers do |t|
      t.string :username
      t.string :password_digest
      t.string :email

      t.timestamps
    end
    add_index :registers, :email, unique: true
  end
end
