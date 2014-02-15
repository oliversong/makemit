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
      pkey =
        pkey: @request.body.pkey

      Meteor.call 'makeKey', pkey, (error, id)->
        if error
          Errors.throw(error.reason)

      @response.writeHead(200, {'Content-Type': 'text/html'});
      @response.end('hello from server');
