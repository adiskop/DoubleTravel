class CreateVisitedGems < ActiveRecord::Migration[6.1]
  def change
    create_table :visited_gems do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
