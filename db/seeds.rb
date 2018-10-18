4.times do |_|
  User.create(
        first_name: Faker::Name.first_name,
        middle_name: Faker::Name.middle_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email
  )
end

theme = Faker::Book.genre
15.times do |step|
  theme = Faker::Book.genre if (step%2).zero?
  Course.create(
    label: Faker::Book.title,
    theme: theme
  )
end

16.times do |step|
  Price.create(
    course_id: step,
    cost: Faker::Number.decimal(3, 2)
  )
end

5.times do |_|
  PromoCode.create(
    course_id: rand(15),
    identifier: Faker::Finance.credit_card,
    lessons_size: rand(10),
    days: rand(25),
  )
end

50.times do |_|
  Lesson.create(
    course_id: rand(15),
    label: Faker::Book.title,
    description: Faker::StarWars.wookiee_sentence
  )
end


5.times do |_|
  UsersPromoCode.create(
    user_id: rand(4),
    promo_code_id: rand(5),
    )
end
