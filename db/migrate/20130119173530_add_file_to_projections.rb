class AddFileToProjections < ActiveRecord::Migration
  def change
    add_column :projections, :file, :string
  end
end
