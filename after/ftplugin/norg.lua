vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.wrap = true
vim.opt_local.linebreak = true
vim.opt_local.conceallevel = 3
vim.opt_local.concealcursor = 'nvc'
vim.opt_local.listchars = { multispace = ' ' }

vim.keymap.set('n', '<leader>nt', ':Neorg toc right<CR>', {
  buffer = 0, -- Aplica apenas ao buffer atual
  silent = true,
  noremap = true,
  desc = 'Neorg: Abrir índice à direita',
})

vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { buffer = 0, noremap = true, expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { buffer = 0, noremap = true, expr = true, silent = true })

vim.keymap.set(
  'n',
  '<CR>',
  '<Plug>(neorg.esupports.hop.hop-link)',
  { buffer = true, desc = 'Pule para o destino do link sob o cursor' }
)
vim.keymap.set(
  'n',
  '<,',
  '<Plug>(neorg.promo.demote)',
  { buffer = true, desc = 'Rebaixar um objeto de forma não recursiva' }
)
vim.keymap.set(
  'n',
  '<<',
  '<Plug>(neorg.promo.demote.nested)',
  { buffer = true, desc = 'Rebaixar um objeto recursivamente' }
)
vim.keymap.set(
  'n',
  '>.',
  '<Plug>(neorg.promo.promote)',
  { buffer = true, desc = 'Promover um objeto de forma não recursiva' }
)
vim.keymap.set(
  'n',
  '>>',
  '<Plug>(neorg.promo.promote.nested)',
  { buffer = true, desc = 'Promover um objeto de forma recursiva' }
)

vim.keymap.set(
  'n',
  '<C-Space>',
  '<Plug>(neorg.qol.todo-items.todo.task-cycle)',
  { buffer = true, desc = 'Alternar a tarefa sob o cursor entre alguns estados selecionados' }
)

vim.keymap.set(
  'n',
  '<leader>nc',
  '<Plug>(neorg.looking-glass.magnify-code-block)',
  { buffer = true, desc = 'Amplia um bloco de código para um buffer separado.' }
)

vim.keymap.set(
  'n',
  '<leader>la',
  '<Plug>(neorg.qol.todo-items.todo.task-ambiguous)',
  { buffer = true, desc = 'Marcar a tarefa sob o cursor como "ambígua"' }
)
vim.keymap.set(
  'n',
  '<leader>lc',
  '<Plug>(neorg.qol.todo-items.todo.task-cancelled)',
  { buffer = true, desc = 'Marcar a tarefa sob o cursor como "cancelada"' }
)
vim.keymap.set(
  'n',
  '<leader>ld',
  '<Plug>(neorg.qol.todo-items.todo.task-done)',
  { buffer = true, desc = 'Marcar a tarefa sob o cursor como "concluida"' }
)
vim.keymap.set(
  'n',
  '<leader>lh',
  '<Plug>(neorg.qol.todo-items.todo.task-on-hold)',
  { buffer = true, desc = 'Marcar a tarefa sob o cursor como "em espera"' }
)
vim.keymap.set(
  'n',
  '<leader>li',
  '<Plug>(neorg.qol.todo-items.todo.task-important)',
  { buffer = true, desc = 'Marcar a tarefa sob o cursor como "importante"' }
)
vim.keymap.set(
  'n',
  '<leader>lp',
  '<Plug>(neorg.qol.todo-items.todo.task-pending)',
  { buffer = true, desc = 'Marcar a tarefa sob o cursor como "pendente"' }
)
vim.keymap.set(
  'n',
  '<leader>lr',
  '<Plug>(neorg.qol.todo-items.todo.task-recurring)',
  { buffer = true, desc = 'Marcar a tarefa sob o cursor como "recorrente"' }
)
vim.keymap.set(
  'n',
  '<leader>lu',
  '<Plug>(neorg.qol.todo-items.todo.task-undone)',
  { buffer = true, desc = 'Marcar a tarefa sob o cursor como "desfeita"' }
)

vim.keymap.set(
  'n',
  '<C-CR>',
  '<Plug>(neorg.esupports.hop.hop-link.vsplit)',
  { buffer = true, desc = 'abrir o destino em uma divisão vertical' }
)

vim.keymap.set('v', '<', '<Plug>(neorg.promo.demote.range)', { buffer = true, desc = 'Rebaixar objetos no intervalo' })
vim.keymap.set('v', '>', '<Plug>(neorg.promo.promote.range)', { buffer = true, desc = 'Promover objetos no intervalo' })
