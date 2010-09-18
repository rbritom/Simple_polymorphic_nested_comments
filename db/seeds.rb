# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
  10.times do
    @article = Article.new
    @article.title = Faker::Lorem.words(12)
    @article.body = Faker::Lorem.paragraphs(4)
    @article.save
  end

  10.times do
    @proyect = Proyect.new
    @proyect.name = Faker::Lorem.words(12)
    @proyect.description = Faker::Lorem.paragraphs(4)
    @proyect.save
  end