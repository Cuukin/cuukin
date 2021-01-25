# Admin Users
# Remember everyone to update their password

helena = {
  admin: true,
  name: 'Helena',
  username: 'LovelyCarrot20',
  email: 'helenad.mim2021@london.edu',
  password: 'cuukin2020'
}

faris = {
  admin: true,
  name: 'Faris',
  username: 'HappySpinach33',
  email: 'fraucci.mba2022@london.edu',
  password: 'cuukin2020'
}

guilherme = {
  admin: true,
  name: 'Guilherme',
  username: 'CrazyBroccoli504',
  email: 'guilhermevmanhaes@gmail.com',
  password: 'cuukin2020'
}

wanmeng = {
  admin: true,
  name: 'Wanmeng',
  username: 'AmazingGarlic208',
  email: 'wzhang.mba2022@london.edu',
  password: 'cuukin2020'
}

elie = {
  admin: true,
  name: 'Elie',
  username: 'CoolPotato94',
  email: 'emhanna.mba2021@london.edu',
  password: 'cuukin2020'
}

ricardo = {
  admin: true,
  name: 'Ricardo',
  username: 'GloriousMushroom45',
  email: 'ricardob.mba2021@london.edu',
  password: 'cuukin2020'
}

julia = {
  admin: true,
  name: 'Julia',
  username: 'CheeryZucchini83',
  email: 'julia-frederico@outlook.com',
  password: 'cuukin2020'
}

admin_users = [helena, faris, guilherme, wanmeng, elie, ricardo, julia]

admin_users.each do |admin|
  user = User.new(admin)
  user.skip_confirmation!
  user.save!
  puts "Created #{admin[:name]}."
end

puts "Remember them to confirm their emails and change their password 🍕"


# Skills

skills = %w(Chopping Seasoning Oven CookPasta CookVegetables CookChicken CookRice PanFry Platting FreshPasta)

skills.each do |skill|
  new_skill = Skill.create(name: skill)
  puts "Created #{new_skill.name} skill"
end
