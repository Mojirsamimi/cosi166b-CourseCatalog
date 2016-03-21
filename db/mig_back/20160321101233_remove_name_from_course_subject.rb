class RemoveNameFromCourseSubject < ActiveRecord::Migration
  def change
     change_table(:courses_subjects) do |t|
      t.remove :name
    end
  end
end
