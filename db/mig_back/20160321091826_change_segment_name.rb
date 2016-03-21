class ChangeSegmentName < ActiveRecord::Migration
  def change
    rename_table :segments, :courses_subjects
  end
end
