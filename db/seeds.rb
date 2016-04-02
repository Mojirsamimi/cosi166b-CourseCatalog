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
Courses_subject.delete_all
Enrollment.delete_all

File.open(File.join(Rails.root, 'db/json', 'dataset.json'), "r").each_line do |line|
  jsn = JSON.parse(line)
  if jsn['type']=="subject"
    new_subj=Subject.create(id: jsn['id'], name: jsn['name'],abbreviation: jsn['abbreviation'], comment: jsn['comment'])
    new_subj.save
  elsif jsn['type']=="course"
    new_crs=Course.create(id: jsn['id'],name: jsn['name'],description: jsn['description'], code: jsn['code'],credits: jsn['credits'],continuity_id: jsn['continuity_id'],independent_study: jsn['independent_study'])
    new_crs.save
    subj=jsn['subjects']
    subj.each do |s|
      if Courses_subject.where(subject_id: s['id'],course_id: jsn['id']).size==0     
        cs=Courses_subject.create(subject_id: s['id'],course_id: jsn['id'])
        cs.save
      end
    end
  elsif jsn['type']=="instructor"
    new_ins=Instructor.create(id: jsn['id'],first: jsn['first'],middle: jsn['middle'], last: jsn['last'],email: jsn['email'],comment: jsn['comment'])
    new_ins.save
  end
end

#subj_json = File.read(File.join(Rails.root, 'db/json', 'subject.json'))
#subj = JSON.parse(subj_json)

#subj.each do |s|
# new_subj=Subject.create(name: s['name'],abbreviation: s['abbreviation'], comment: s['comment'])
# new_subj.save
#end

#ins_json = File.read(File.join(Rails.root, 'db/json', 'instructor.json'))
#ins = JSON.parse(ins_json)

#ins.each do |i|
# new_ins=Instructor.create(first: i['first'],middle: i['middle'], last: i['last'],email: i['email'],comment: i['comment'])
# new_ins.save
#end

#crs_json = File.read(File.join(Rails.root, 'db/json', 'course.json'))
#crs = JSON.parse(crs_json)

#crs.each do |c|
# new_crs=Course.create(name: c['name'],description: c['description'], code: c['code'],credits: c['credits'],continuity_id: c['continuity_id'],independent_study: c['independent_study'])
# new_crs.save
#end

#Segment.create(name: "graduate division", subject_id: 1,course_id: 1)