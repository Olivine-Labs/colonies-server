local methods = {

  GET = function(self, id, input)

    context.response.status = 204
  end,

  OPTIONS = function(self, id, input)
    context.output = {
      name = "Location API",
      description = "Allows movement of units and contains location information for all game entities",
      index = "gameid",
      resource = {
        gameid = "String",
        name = "String",
        units = {
          type = "Object",
          description = "A hash of units where the key is the id of the unit and the value is an object.",
          resource = {
            x = "Integer",
            y = "Integer"
          }
        },
        cities = {
          type = "Object",
          description = "A hash of cities where the key is the id of the city and the value is an object.",
          resource = {
            x = "Integer",
            y = "Integer"
          }
        },
      }
    }
    context.response.status = 200
  end
}

context.response.status = 400
local method = context.request.method
return methods[method] and methods[method](methods, id, context.input)
