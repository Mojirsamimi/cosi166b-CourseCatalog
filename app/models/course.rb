class Course < ActiveRecord::Base
  has_many :enrollments
  has_many :users, through: :enrollments
  has_and_belongs_to_many :subjects
  self.primary_key = 'id'
  def self.search(name)
    where("name like ?", "%#{name}%") 
  end
end
