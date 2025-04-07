return {
  {
    'gbprod/substitute.nvim',
    opts = {},
    keys = {
      {
        'gr',
        function()
          require('substitute').operator()
        end,
        mode = { 'n' },
        desc = 'Substitute Operator',
        noremap = true,
      },
      {
        'grr',
        function()
          require('substitute').line()
        end,
        mode = { 'n' },
        desc = 'Substitute Line',
        noremap = true,
      },
      {
        'cx',
        function()
          require('substitute.exchange').operator()
        end,
        mode = { 'n' },
        desc = 'Exchange Operator',
        noremap = true,
      },
      {
        'cxx',
        function()
          require('substitute.exchange').line()
        end,
        mode = { 'n' },
        desc = 'Exchange Line',
        noremap = true,
      },
    },
  },
}
