class Subject < ActiveRecord::Base
  has_and_belongs_to_many :courses
  self.primary_key = 'id'
  def name_and_id
    name+'('+id+')'
  end
end
