# Admin Users
# Remember everyone to update their password

helena = {
  admin: true,
  first_name: 'Helena',
  last_name: 'Couto',
  email: 'helenad.mim2021@london.edu',
  password: 'cuukin2020'
}

faris = {
  admin: true,
  first_name: 'Faris',
  last_name: 'Raucci',
  email: 'fraucci.mba2022@london.edu',
  password: 'cuukin2020'
}

guilherme = {
  admin: true,
  first_name: 'Guilherme',
  last_name: 'Vieira',
  email: 'guilhermevmanhaes@gmail.com',
  password: 'cuukin2020'
}

wanmeng = {
  admin: true,
  first_name: 'Wanmeng',
  last_name: 'Zhang',
  email: 'wzhang.mba2022@london.edu',
  password: 'cuukin2020'
}

elie = {
  admin: true,
  first_name: 'Elie',
  last_name: 'Mhanna',
  email: 'emhanna.mba2021@london.edu',
  password: 'cuukin2020'
}

ricardo = {
  admin: true,
  first_name: 'Ricardo',
  last_name: 'Brandao',
  email: 'ricardob.mba2021@london.edu',
  password: 'cuukin2020'
}

julia = {
  admin: true,
  first_name: 'Julia',
  last_name: 'Frederico',
  email: 'julia-frederico@outlook.com',
  password: 'cuukin2020'
}

admin_users = [helena, faris, guilherme, wanmeng, elie, ricardo, julia]

admin_users.each do |admin|
  user = User.new(admin)
  user.skip_confirmation!
  user.save!
  puts "Created #{admin[:first_name]}."
end

puts "Remember them to confirm their emails and change their password 🍕"
