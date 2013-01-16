class CreatePaintings < ActiveRecord::Migration
  def change
    create_table :paintings, :inherits => :projection do |t|
      t.text :description
    end
  end
end
