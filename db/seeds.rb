# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

require 'fastercsv'
print "loading #{RAILS_ROOT}/db/csv/postcodes.csv"
FasterCSV.foreach("#{RAILS_ROOT}/db/csv/postcodes.csv" , :headers=>true) do |row|
  Postcode.create(:id => row['id'], :number => row['number'], :suburb => row['suburb'])
end

print "loading #{RAILS_ROOT}/db/csv/people.csv"
FasterCSV.foreach("#{RAILS_ROOT}/db/csv/people.csv" , :headers=>true) do |row|
  Person.create(:id => row['id'], :name => row['name'], :postcode_id => row['postcode_id'], :email => row['email'])
end