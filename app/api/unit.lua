local methods = {

  GET = function(self, id, input)

    context.response.status = 204
  end,

  OPTIONS = function(self, id, input)
    context.output = {
      name = "Unit API",
      description = "Allows management of unit resources",
      index = "id",
      resource = {
        id = "String",
        name = "String",
        skills = {
          type = "Object",
          description = "A hash of unit skills where the key is the id of the skill and the value is the level.",
          resource = {
            skillid = "Integer"
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
