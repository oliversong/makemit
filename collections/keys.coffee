@Keys = new Meteor.Collection 'keys'

Meteor.methods(
  makeKey: (keyAttributes)->
    console.log keyAttributes
    if not keyAttributes.pkey
      console.log "Incorrect pkey"
    key =
      pkey: keyAttributes.pkey
    keyId = Keys.insert(key)
    keyId
)
