class CreatePokemons < ActiveRecord::Migration[7.1]
  def change
      create_table :pokemons do |t|
        t.string :name
        t.string :role
        t.integer :level
        t.string :evolution

        t.timestamps
      end
  end
end
