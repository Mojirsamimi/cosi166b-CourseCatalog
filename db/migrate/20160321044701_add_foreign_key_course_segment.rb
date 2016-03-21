class AddForeignKeyCourseSegment < ActiveRecord::Migration
  def change
    add_reference :segments, :course, index: true, foreign_key: true
  end
end
