class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string  :name
      t.text    :instructions
      t.integer :servings
      t.integer :course_id

      t.timestamps null: false
    end
  end
end
