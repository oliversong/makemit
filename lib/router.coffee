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
      console.log(@request.body.pkey)
      blob = JSON.parse(@request.body.pkey)
      privatekeys = []
      for i,j in blob.names
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
