class DeviseCreateUsuarios < ActiveRecord::Migration
  def change
    create_table(:usuarios) do |t|
      t.database_authenticatable :null => false
      t.recoverable
      t.rememberable
      t.trackable

      t.string :login
      t.string :nombre
      t.string :website
      t.string :ubicacion
      t.date :fecha_nacimiento
      t.text :acerca_de
      t.integer :reputacion

      # t.encryptable
      # t.confirmable
      # t.lockable :lock_strategy => :failed_attempts, :unlock_strategy => :both
      # t.token_authenticatable


      t.timestamps
    end

    add_index :usuarios, :email,                :unique => true
    add_index :usuarios, :reset_password_token, :unique => true
    # add_index :usuarios, :confirmation_token,   :unique => true
    # add_index :usuarios, :unlock_token,         :unique => true
    # add_index :usuarios, :authentication_token, :unique => true
  end

end
