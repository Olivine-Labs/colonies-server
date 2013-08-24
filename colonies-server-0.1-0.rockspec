package = "colonies-server"
version = "0.1-0"
source = {
  url = "",
  dir = "."
}
description = {
  summary = "Like Civ, only better",
  detailed = [[
    Like Civ, only better
  ]],
  homepage = "https://github.com/Olivine-Labs/colonies-server?source=c",
  license = "Copyright 2013 Olivine Labs"
}
dependencies = {
  "lua >= 5.1",
  "lua_cliargs >= 2.0",
  "busted >= 1.5.0",

  "lusty >= 0.2-0",
  "lusty-config >= 0.2-0",
  "lusty-json >= 0.3-0",
  "lua-cjson >= 2.1.0-1",
  "lusty-log >= 0.1-0",
  "lusty-log-console >= 0.1-0",
  "lusty-nginx >= 0.1-0",
  "lusty-request-pattern >= 0.1-0",
  --"lusty-statsd >= 0.1-0"

}
build = {
  type = "builtin",
  modules = {
  },
  install = {
  }
}
