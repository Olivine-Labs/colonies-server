local methods = {

  GET = function(self, id, input)

    context.response.status = 204
  end,

  OPTIONS = function(self, id, input)
    context.output = {
      name = "Map API",
      description = "Generates maps by seed and type. This resource is an interface to a function. You will always HTTP GET to this API.",
      index = "id",
      resource = {
        id = "String",
        type = {
          type="String",
          description = "defines what terrain generator this map should use",
          values = {
            "Continents",
            "Large Islands",
            "Small Islands",
            "Black Forest",
            "Amazon",
            "Random"
          }
        },
        water = "Integer",
        terrain = "Integer",
        weather = "Integer",
        temperature = "Integer"
      }
    }

    context.response.status = 200
  end
}

context.response.status = 400
local method = context.request.method
return methods[method] and methods[method](methods, id, context.input)
