class CreateProjections < ActiveRecord::Migration

  def change
    create_table :projections do |t|
      t.string :category
      t.string :name
      t.text :description
      t.integer :user_id
      t.timestamps
    end
    add_index :projections, [:user_id, :created_at]
  end

end
