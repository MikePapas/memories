class CreateMemories < ActiveRecord::Migration
  def change
    create_table :memories do |t|
      t.integer :user_id
      t.string :title
      t.text :description
      t.string :video
      t.string :photo
      t.date :date
      t.string :location
      t.string :mood
      t.string :occasion
      t.string :sounds_like
      t.string :smells_like

      t.timestamps
    end
    add_index :memories, [:user_id]
  end
end
