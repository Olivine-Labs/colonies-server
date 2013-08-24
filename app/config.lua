local json = require 'cjson'

return {
  subscribers = {
    ['input'] = {
      -- decode json input if it exists in the body data.
      -- you can provide -- options to the handler as a table.
      -- in this case, we are passing in a json encoding/decoding function.
      ['lusty-json.input.json'] = { json = json }
    },

    -- / is routed to /index in nginx
    -- ./handlers/requests/index.lua is loaded when /index is requested
    ['request'] = { ['lusty-request-pattern.request.pattern'] = {
      patterns = {
        { ['index']                   = 'requests.index' },
      }
    }},
    ['request:404'] = {['lusty-request-file.request.file'] = 'requests.404'},
    ['request:500'] = {['lusty-request-file.request.file'] = 'requests.500'},

    ['error'] = {
      ['lusty-error-status.error.status'] = {
        prefix = {{'input'}},
        status = {
          [500] = {{'request:500'}},
          [404] = {'request:404'}
        },
        suffix = {{'output'}}
      }
    },

    -- capture html requests as mustache handlers, and
    -- capture json requests to output handler data as json
    ['output'] = {
      ['lusty-json.output.json'] = { json = json, default = true }
    },

    -- log events should write to the console
    -- log events should also go up to nginx
    ['log'] = {
      'lusty-log-console.log.console'
    }
  },

  -- as requests come in, fire these events in order (corresponding to
  -- subscribers above)
  publishers = {
    {'input'},
    {'request'},
    {'error'},
    {'output'}
  },

  -- bind context methods to the context object that is passed around, so you
  -- can use things like context.log and context.store from within your handler
  context = {
    ['lusty-log.context.log'] = { level = 'debug' }

    --['lusty-statsd.context.statsd'] = {
    --  host = "127.0.0.1",
    --  namespace= "lusty-example"
    --}
  }
}
