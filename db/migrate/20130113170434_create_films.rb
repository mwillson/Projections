class CreateFilms < ActiveRecord::Migration
  def change
    create_table :films, :inherits => :projection do |t|
      t.text :description
    end
  end
end
