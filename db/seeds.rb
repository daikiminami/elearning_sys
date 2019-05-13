User.create!(
  name: "Daiki Minami",
  email: "rondaiten83@gmail.com",
  password: "password",
  admin: true
)

50.times do |n|
  User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email,
    password: "password",
    admin: false
  )
end

  user = User.first
  followers = User.all

  followers[2..50].each do |follower|
    follower.follow(user)
  end

  followers[40..50].each do |follower|
    user.follow(follower)
  end

