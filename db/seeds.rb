# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

SystemAbility.create([{ name: 'CREATE' }, { name: 'READ' }, { name: 'UPDATE' }, { name: 'DELETE' }])
SystemModule.create([{ name: 'All' }, 
                     { name: 'Customer' },
                     { name: 'CustomerPj' },
                     { name: 'CustomerPf' }, 
                     { name: 'BusinessActivity' }, 
                     { name: 'BusinessSegment' }, 
                     { name: 'BusinessActivity' }, 
                     { name: 'Contact' }, 
                     { name: 'Micropost' },
                     { name: 'State' }, 
                     { name: 'City' }, 
                     { name: 'District' },])