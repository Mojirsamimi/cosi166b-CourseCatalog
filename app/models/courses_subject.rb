class Courses_subject < ActiveRecord::Base
  belongs_to :course
  belongs_to :subject
end