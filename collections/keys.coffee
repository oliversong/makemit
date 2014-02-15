@Keys = new Meteor.Collection 'keys'

Meteor.methods(
  makeKey: (keyAttributes)->
    if not keyAttributes.pkey
      throw new Meteor.Error(422, "Please submit key")
    key =
      pkey: keyAttributes.pkey
    keyId = Keys.insert(key)
    keyId
)
