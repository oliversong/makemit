Router.configure
  loadingTemplate: 'loading'
  layoutTemplate: 'layout'

Router.map ->
  @route 'landingPage',
    path: '/'

  @route 'key',
    path: '/key/:keyname'
    action: ()->
      pkey =
        pkey: @params.keyname

      Meteor.call 'makeKey', pkey, (error, id)->
        if error
          Errors.throw(error.reason)

      @response.writeHead(200, {'Content-Type': 'text/html'});
      @response.end('hello from server');
