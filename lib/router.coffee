Router.map ->
  @route 'landingPage',
    loadingTemplate: 'loading'
    layoutTemplate: 'layout'
    path: '/'

  @route 'key',
    path: '/key'
    where: 'server'
    action: ()->
      console.log('hit key')
      blob = JSON.parse(@request.body.pkey)
      privatekeys = []
      console.log "blob.names:"
      console.log blob.names
      for i,j of blob.names
        console.log i
        console.log j
        for x in blob.keys
          if x.addr is i
            console.log("Private keyfound")
            privatekeys.push(
              key: x.private
              label: j
            )
      for y in privatekeys
        pkey =
          pkey: y.key
          label: y.label
        Meteor.call 'makeKey', pkey, (error, id)->
          if error
            Errors.throw(error.reason)

      @response.writeHead(200, {'Content-Type': 'text/html'});
      @response.end('hello from server');
