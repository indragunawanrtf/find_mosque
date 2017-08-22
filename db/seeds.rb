# USAGE:
#   ~> seed all files
#     command: rake db:seeds
#   ~> spesific files
#     command: SEED_FILES=01-users,05-game_types,08-game_histories rake db:seed

puts "Seeding data"

def load_rb(seed)
  require 'yaml'
  puts "#{Time.now} | Execute seed #{seed.inspect}"
  require "#{seed}"
  klass_name = ("seed_" + File.basename("#{seed}", '.rb').split('-').last).classify
  klass = klass_name.constantize
  klass.send(:seed)
end

if ENV['SEED_FILES'].present?
  seed_files = ENV['SEED_FILES'].split(',')
  seed_files.each do |seed_name|
    load_rb("#{Rails.root}/db/seeds/#{seed_name}.rb")
  end
else
  Dir["#{Rails.root}/db/seeds/**/*.rb"].sort.each do |seed|
    load_rb(seed)
  end
end

puts "Done!"
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
