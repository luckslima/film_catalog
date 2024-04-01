class CreateFilms < ActiveRecord::Migration[7.1]
  def change
    create_table :films do |t|
      t.string :name
      t.string :year

      t.timestamps
    end
  end
end
