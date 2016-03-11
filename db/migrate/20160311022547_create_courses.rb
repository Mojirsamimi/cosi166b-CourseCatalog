class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name
      t.text :description
      t.string :code
      t.float :credits
      t.string :continuity_id
      t.boolean :independent_study

      t.timestamps null: false
    end
  end
end
