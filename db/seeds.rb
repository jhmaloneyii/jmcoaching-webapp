# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Post.destroy_all
20.times do |x|
  image = Faker::LoremFlickr.image
  if Post.create!(
    title: "Seed Blog Post #{x}",
    content: Faker::Lorem.paragraph(100),
    summary: Faker::Lorem.paragraph(1),
    active: true,
    remote_image_url: "https://loremflickr.com/300/300"
    ) then p "Seeded Post #{x}" else p "failed seed #{x}"
  end
end

Admin.create(username: "jmcoaching", email: "jmcoachingllc@gmail.com", password: 'password')
