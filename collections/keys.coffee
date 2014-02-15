@Keys = new Meteor.Collection 'keys'

Meteor.methods(
  makeKey: (keyAttributes)->
    console.log keyAttributes
    if not keyAttributes.pkey
      console.log "Incorrect pkey"
    if not keyAttributes.label
      console.log "No label"
    key =
      pkey: keyAttributes.pkey
      label: keyAttributes.label

    keyId = Keys.insert(key)
    keyId
)
