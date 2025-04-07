return {
  'mbbill/undotree',
  keys = {
    {
      '<F5>',
      function()
        vim.cmd.UndotreeToggle()
      end,
      desc = 'Undotree Toggle',
    },
  },
}
