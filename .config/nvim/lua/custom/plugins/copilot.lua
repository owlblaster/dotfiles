return {
  {
    {
      'github/copilot.vim',
    },
    {
      'CopilotC-Nvim/CopilotChat.nvim',
      dependencies = {
        { 'github/copilot.vim' }, -- or zbirenbaum/copilot.lua
        { 'nvim-lua/plenary.nvim', branch = 'master' }, -- for curl, log and async functions
      },
      build = 'make tiktoken', -- Only on MacOS or Linux
      opts = {
        -- See Configuration section for options
      },
      keys = {
        {
          '<leader>cc',
          function()
            require('CopilotChat').open()
          end,
          desc = 'Copilot Chat',
        },
      },
      init = function()
        vim.api.nvim_create_autocmd('BufEnter', {
          pattern = 'copilot-*',
          callback = function()
            -- Set buffer-local options
            vim.opt_local.relativenumber = false
            vim.opt_local.number = false
            vim.opt_local.conceallevel = 0
            vim.b.completion = false
          end,
        })
      end,
      -- See Commands section for default commands if you want to lazy load on them
    },
  }, -- {
  --   'zbirenbaum/copilot.lua',
  --   cmd = 'Copilot',
  --   event = 'InsertEnter',
  --   config = function()
  --     require('copilot').setup {
  --       suggestion = {
  --         auto_trigger = true,
  --       },
  --     }
  --   end,
  -- },
}
