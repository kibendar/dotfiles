local config = {
  cmd = { "jdtls" },
  settings = {
    java = {
      configuration = {
        runtimes = {
          {
            name = "JavaSE-25",
            path = "~/.sdkman/candidates/java/25.0.1-tem/",
          },
        },
      },
    },
  },
}

require("jdtls").start_or_attach(config)
