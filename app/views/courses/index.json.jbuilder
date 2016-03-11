json.array!(@courses) do |course|
  json.extract! course, :id, :name, :description, :code, :credits, :continuity_id, :independent_study
  json.url course_url(course, format: :json)
end
