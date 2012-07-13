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
    
    def states
      State.create(acronym: "AC", name: "Acre")
      State.create(acronym: 'AL', name: 'Alagoas');
      State.create(acronym: 'AM', name: 'Amazonas');
      State.create(acronym: 'AP', name: 'Amapá');
      State.create(acronym: 'BA', name: 'Bahia');
      State.create(acronym: 'CE', name: 'Ceará');
      State.create(acronym: 'DF', name: 'Distrito Federal');
      State.create(acronym: 'ES', name: 'Espírito Santo');
      State.create(acronym: 'GO', name: 'Goiás');
      State.create(acronym: 'MA', name: 'Maranhão');
      State.create(acronym: 'MG', name: 'Minas Gerais');
      State.create(acronym: 'MS', name: 'Mato Grosso do Sul');
      State.create(acronym: 'MT', name: 'Mato Grosso');
      State.create(acronym: 'PA', name: 'Pará');
      State.create(acronym: 'PB', name: 'Paraíba');
      State.create(acronym: 'PE', name: 'Pernambuco');
      State.create(acronym: 'PI', name: 'Piauí');
      State.create(acronym: 'PR', name: 'Paraná');
      State.create(acronym: 'RJ', name: 'Rio de Janeiro');
      State.create(acronym: 'RN', name: 'Rio Grande do Norte');
      State.create(acronym: 'RR', name: 'Roraima');
      State.create(acronym: 'RO', name: 'Rondônia');
      State.create(acronym: 'RS', name: 'Rio Grande do Sul');
      State.create(acronym: 'SC', name: 'Santa Catarina');
      State.create(acronym: 'SE', name: 'Sergipe');
      State.create(acronym: 'SP', name: 'São Paulo');
      State.create(acronym: 'TO', name: 'Tocantins');
    end
    
    def cities
      City.create(name: 'Fortaleza')
    end
    
    def segments
      BusinessSegment.create(name:'Segmento Padrão')
    end
    
    
    def activities
      BusinessActivity.create(name:'Atividade Padrão')
    end
    
    #AUXI <-----------
    
    states()
    cities()
    segments()
    activities()
  end
end