class AddForeignKeySubjectSegment < ActiveRecord::Migration
  def change
    add_reference :segments, :subject, index: true, foreign_key: true
  end
end
