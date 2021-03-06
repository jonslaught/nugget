
if Meteor.isServer
  
  Accounts.onCreateUser (opt, user) ->
    opt.profile.picture = "http://graph.facebook.com/#{user.services.facebook.id}/picture/?type=large"
    user.profile = opt.profile
    return user

  Accounts.loginServiceConfiguration.findOrInsert
    service: 'facebook',
    appId: '170815603107723',
    secret: 'f4b57f457041802e1f0ba76a0d1c44e3'

if Meteor.isClient

  Template.header.events
    'click .logout': -> Meteor.logout()
    'click .login': -> Meteor.loginWithFacebook()