# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'rubygems'
require 'json'

Subject.delete_all
Instructor.delete_all
Course.delete_all

subj_json = File.read(File.join(Rails.root, 'db/json', 'subject.json'))
subj = JSON.parse(subj_json)

subj.each do |s|
 new_subj=Subject.create(name: s['name'],abbreviation: s['abbreviation'], comment: s['comment'])
 new_subj.save
end

ins_json = File.read(File.join(Rails.root, 'db/json', 'instructor.json'))
ins = JSON.parse(ins_json)

ins.each do |i|
 new_ins=Instructor.create(first: i['first'],middle: i['middle'], last: i['last'],email: i['email'],comment: i['comment'])
 new_ins.save
end

crs_json = File.read(File.join(Rails.root, 'db/json', 'course.json'))
crs = JSON.parse(crs_json)

crs.each do |c|
 new_crs=Course.create(name: c['name'],description: c['description'], code: c['code'],credits: c['credits'],continuity_id: c['continuity_id'],independent_study: c['independent_study'])
 new_crs.save
end
