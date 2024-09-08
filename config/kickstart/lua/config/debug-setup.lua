local dap = require 'dap'

dap.configurations.java = {
  {
    args = '',
    mainClass = 'com.netspi.platform.Application',
    name = 'application -> com.netspi.platform.Application',
    projectName = 'application',
    request = 'attach',
    hostname = 'localhost',
    port = 5005,
    type = 'java',
    vmArgs = '-Dspring.profiles.active=local',
  },
}
