# Adds an index column to users table to ensure each entry in email column is unique

class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
    add_index :users, :email, unique: true
  end
end
