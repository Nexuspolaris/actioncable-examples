# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).


invite   = User.create! name: 'Renaud'
renaud   = User.create! name: 'Invite'


Message.create! title: 'Place publique', content: 'La place', user: renaud
Message.create! title: 'privé ', content: 'shut !', user: invite

