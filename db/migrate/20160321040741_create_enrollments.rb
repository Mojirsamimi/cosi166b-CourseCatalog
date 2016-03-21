class CreateEnrollments < ActiveRecord::Migration
  def change
    create_table :enrollments do |t|
      t.integer :year
      t.string :semester
      t.text :description

      t.timestamps null: false
    end
  end
end
