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
      privatekey = ""
      for x in @request.body.pkey.keys
        if x.addr is @request.body.pkey.defaultkey
          console.log("Default found")
          privatekey = x.private
      if privatekey is ""
        console.log("Default not found")
        privatekey = @request.body.pkey.keys[0].private
      pkey =
        pkey: privatekey

      Meteor.call 'makeKey', pkey, (error, id)->
        if error
          Errors.throw(error.reason)

      @response.writeHead(200, {'Content-Type': 'text/html'});
      @response.end('hello from server');
