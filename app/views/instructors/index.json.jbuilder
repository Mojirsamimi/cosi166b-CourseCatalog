json.array!(@instructors) do |instructor|
  json.extract! instructor, :id, :first, :middle, :last, :email, :comment
  json.url instructor_url(instructor, format: :json)
end
