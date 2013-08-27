local methods = {

  GET = function(self, id, input)

    context.response.status = 204
  end,

  OPTIONS = function(self, id, input)
    context.output = {
      name = "Civilization API",
      description = "This API is used to control the Civilization resource in game.",
      index = "id",
      resource = {
        id = "String",
        tech = {
          type = "Object",
          description = "A hash of technologies where the key is the id of the technology.",
          resource = {
            techid = "Boolean"
          }
        },
        social = {
          type = "Object",
          description = "A hash of social policies where the key is the id of the policy.",
          resource = {
            policyid = "Boolean"
          }
        },
        perks = {
          type = "Object",
          description = "A hash of perk ids the civilization has either acquired or started with",
          resource = {
            perkid = "Boolean"
          }
        }
      }
    }
    context.response.status = 200
  end
}

context.response.status = 400
local method = context.request.method
return methods[method] and methods[method](methods, id, context.input)
