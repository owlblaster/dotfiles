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
        mappings = {
          complete = {
            insert = '<C-y>',
          },
          close = {
            normal = 'q',
            insert = '<C-c>',
          },
          reset = {
            normal = '<C-l>',
            insert = '<C-l>',
          },
          submit_prompt = {
            normal = '<CR>',
            insert = '<C-s>',
          },
          toggle_sticky = {
            normal = 'grr',
          },
          clear_stickies = {
            normal = 'grx',
          },
          accept_diff = {
            normal = '<C-y>',
            insert = '<C-y>',
          },
          jump_to_diff = {
            normal = 'gj',
          },
          quickfix_answers = {
            normal = 'gqa',
          },
          quickfix_diffs = {
            normal = 'gqd',
          },
          yank_diff = {
            normal = 'gy',
            register = '"', -- Default register to use for yanking
          },
          show_diff = {
            normal = '<leader>gd',
            full_diff = true, -- Show full diff instead of unified diff when showing diff window
          },
          show_info = {
            normal = 'gi',
          },
          show_context = {
            normal = 'gc',
          },
          show_help = {
            normal = 'gh',
          },
        },
      },
      keys = {
        { '<leader>zc', ':CopilotChat<CR>', mode = 'n', desc = 'Chat wiht Copilot' },
        { '<leader>ze', ':CopilotChatExplain<CR>', mode = 'v', desc = 'Explain Code' },
        { '<leader>zr', ':CopilotChatReview<CR>', mode = 'v', desc = 'Review Code' },
        { '<leader>zf', ':CopilotChatFix<CR>', mode = 'v', desc = 'Fix Code Issues' },
        { '<leader>zo', ':CopilotChatOptimize<CR>', mode = 'v', desc = 'Optimize Code' },
        { '<leader>zd', ':CopilotChatDocs<CR>', mode = 'v', desc = 'Generate Docs' },
        { '<leader>zt', ':CopilotChatTests<CR>', mode = 'v', desc = 'Generate Tests' },
        { '<leader>zm', ':CopilotChatCommit<CR>', mode = { 'n', 'v' }, desc = 'Generate Commit Message' },
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
