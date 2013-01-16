class CreateProjections < ActiveRecord::Migration
  def change
    create_table :projections do |t|
      t.string :subtype, :null => false
      t.string :name
      t.timestamps
    end
  end
end
