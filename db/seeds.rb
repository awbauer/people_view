# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

file    = Rails.root.join 'config', 'nations.yml'
nations = YAML.load_file file

Nation.destroy_all
nations.each do |slug, attributes|
  attributes['slug'] = slug
  Nation.create! attributes
end

