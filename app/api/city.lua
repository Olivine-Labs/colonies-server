local methods = {

  GET = function(self, id, input)

    context.response.status = 204
  end,

  OPTIONS = function(self, id, input)
    context.output = {
      name = "City API",
      description = "Allows management of city resources",
      index = "id",
      resource = {
        id = "String",
        name = "String",
        structures = {
          type = "Object",
          description = "A hash of structures where the key is the id of the structure.",
          resource = {
            structureid = "Boolean"
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
