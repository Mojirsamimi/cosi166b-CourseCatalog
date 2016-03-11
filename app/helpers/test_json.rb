require 'rubygems'
require 'json'

json = File.read('subject.json')
obj = JSON.parse(json)

obj.each do |f|
 puts f['name']
end
