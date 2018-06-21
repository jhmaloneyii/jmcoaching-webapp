# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Post.destroy_all
p "Posts Cleared"
5.times do |x|
  if Post.create!(
    title: "Seed Blog Post #{x}",
    content: Faker::Lorem.paragraph(100),
    summary: Faker::Lorem.paragraph(1),
    active: [true, false].sample,
    remote_image_url: "https://loremflickr.com/1600/800"
    ) then p "Seeded Post #{x}" else p "failed seed #{x}"
  end
end

Admin.create(username: "jmcoaching", email: "jmcoachingllc@gmail.com", password: 'password')

Tag.destroy_all
8.times do |x|
  if Tag.create!(
    name: Faker::RickAndMorty.character
    ) then p "Seeded Tag #{x}"
  end
end

Product.destroy_all
p "Products Cleared"
ProductField.destroy_all
p "Fields Cleared"
ProductType.destroy_all
p "Types Cleared"
5.times do |x|
  if type = ProductType.create!(
    name: Faker::Coffee.blend_name
    ) then 
    p "Seeded Product #{x}"
    [1,2,3].sample.times do 
      ProductField.create!(
        field_type: ["check_box", "text_field", "boolean", "select"].sample,
        name: Faker::Company.buzzword,
        required: [true, false].sample,
        show: [true, false].sample,
        product_type: type
        )
    end
  end
end

answers = {
  "text_field" => Faker::ChuckNorris.fact,
  "check_box" => [0,1].sample,
  "boolean" => [0,1].sample
}
5.times do |x|
  product = Product.new(
    price: Faker::Number.decimal(2),
    name: Faker::Pokemon.name,
    description: Faker::RickAndMorty.quote,
    product_type: ProductType.all.sample
    )
  for field in product.product_type.fields do
    product.properties[field.name.to_sym] = answers[field.name]
  end
  product.save
end


Post.all.each do |post|
  post.tags << Tag.all.sample([1,2,3].sample)
  post.save!
  p "#{post.title} given tags"
end
