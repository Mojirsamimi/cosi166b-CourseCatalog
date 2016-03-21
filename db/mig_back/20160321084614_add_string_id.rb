class AddStringId < ActiveRecord::Migration
  def change
    change_table(:courses) do |t|
      t.change :id, :string
    end
    change_table(:subjects) do |t|
       t.change :id, :string
    end
    change_table(:segments) do |t|
       t.change :course_id, :string
       t.change :subject_id, :string
    end
    change_table(:enrollments) do |t|
       t.change :course_id, :string
    end
    change_table(:instructors) do |t|
        t.change :id, :string
    end
    
  end
end
