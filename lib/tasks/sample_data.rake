#encoding: utf-8
namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    
    Faker::Config.locale = [:en]
    
    User.destroy_all();
    Micropost.destroy_all();
    
    User.create!(name: "Teste User",
                     email: "teste@teste.com",
                     password: "testes",
                     password_confirmation: "testes")
                     
    admin = User.create!(name: "Adm Sistema",
                        email: "adm@adm.com",
                        password: "admini",
                        password_confirmation: "admini")
    admin.toggle!(:admin)

    logger =  Logger.new(STDOUT)

    8.times do |n|
      name  = "#{Faker::Name.name} Gen #{n} "[0..24]

      logger.info name
      email = "example-#{n+1}@guaracrm.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
    
    users = User.all(limit: 5)
    users[2..4].each do |user|
      26.times do
        content = Faker::Lorem.sentence(5)
        user.microposts.create!(content: content)
      end
    end
    
    
    def make_relationships
      users = User.all
      user  = users.first
      followed_users = users[2..5]
      followers      = users[3..7]
      followed_users.each { |followed| user.follow!(followed) }
      followers.each      { |follower| follower.follow!(user) }
    end
    
    
  end
end