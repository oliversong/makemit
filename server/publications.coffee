Meteor.publish 'keys', ()->
  return Keys.find({})
