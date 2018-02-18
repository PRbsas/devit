# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)




#Faker::Omniauth.github



10.times do
  User.create(
    email: Faker::Internet.email,
    name: Faker::Name.name,
    username: Faker::Internet.user_name,
    bio: Faker::Matz.quote,
    github_profile_url: Faker::Internet.url("github.com"),
    avatar_url: Faker::Avatar.image,
    password: Faker::Internet.password(8)
  )
end

Community.create(title: 'JavaScript', short_description: 'JavaScript (JS) is a lightweight interpreted or JIT-compiled programming language with first-class functions. While it is most well-known as the scripting language for Web pages', user_id: 1)
