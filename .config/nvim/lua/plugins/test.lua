return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/neotest-jest",
      "marilari88/neotest-vitest",
      "rcasia/neotest-java",
    },
    opts = function(_, opts)
      table.insert(
        opts.adapters,
        require("neotest-jest")({
          jestCommand = function()
            return require("neotest-jest.jest-util").getJestCommand(vim.fn.expand("%:p:h")) .. " --coverage"
          end,
          jestConfigFile = function(file)
            if string.find(file, "/apps|libs/") then
              return string.match(file, "(.-/[^/]+/)src") .. "jest.config.ts"
            end

            return vim.fn.getcwd() .. "/jest.config.ts"
          end,
          env = { CI = true },
          cwd = function()
            return vim.fn.getcwd()
          end,
        })
      )
      table.insert(opts.adapters, require("neotest-vitest"))
      table.insert(opts.adapters, require("neotest-java"))
    end,
  },
}
