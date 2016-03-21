require 'rubygems'
require 'json'
File.open("./db/json/dataset.json", "r").each_line do |line|
  crs = JSON.parse(line)
  if crs['type']=="course"
  puts crs['subjects']
  break
  end
end