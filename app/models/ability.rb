class Ability
  include CanCan::Ability

  @@UPDATE = 1
  cattr_reader :CREATE
  
  @@UPDATE = 2
  cattr_reader :READ  

  @@UPDATE = 3
  cattr_reader :UPDATE

  @@DELETE = 4
  cattr_reader :DELETE

  def initialize(user)
    
    user ||= User.new # guest user (not logged in)
    if user.admin?
      can :manage, :all
    else
      
      user.abilities.each do |ab|
        if (ab.model=="all")
          model = :all
        else        
          model = eval(ab.model)
        end
        
        can :create, model  if ab.ability.id == CREATE
        can :read, model   if ab.ability.id == READ
        can :update, model if ab.ability.id == UPDATE
        can :delete, model if ab.ability.id == DELETE
      end 
    end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
