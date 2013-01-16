class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs, :inherits => :projection do |t|
      t.text :description
    end
  end
end
