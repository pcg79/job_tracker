# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

jobs = {
  'Twitter' => 'Manager - Engineering',
  'Facebook' => 'Tech Lead',
  'Amazon' => 'Manager - Engineering - Flex',
  'CustomInk' => 'Manager - Engineering',
  'Dropbox' => 'Manager - Engineering - SEA',
  'PhishMe' => 'Engineer',
  'StitchFix' => 'Principal Engineer/Manager',
  'CareZone' => 'Principal Engineer/Manager'
}

jobs.each do |company, job|
  c = Company.create! name: company
  c.jobs.create title: job
end

