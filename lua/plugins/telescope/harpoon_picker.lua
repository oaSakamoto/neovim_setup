local M = {}

function M.picker(harpoon_itens)
  local conf = require('telescope.config').values
  local themes = require('telescope.themes')

  local file_paths = vim.tbl_map(function(item)
    return item.value
  end, harpoon_itens.items)

  local function get_index(tbl, value)
    for i, v in ipairs(tbl) do
      if v == value then
        return i
      end
    end
    return nil
  end

  require('telescope.pickers')
    .new(
      {},
      themes.get_dropdown({
        prompt_title = 'Harpoon',
        initial_mode = 'normal',
        finder = require('telescope.finders').new_table({
          results = file_paths,
          entry_maker = function(entry)
            local index = get_index(file_paths, entry)
            return {
              value = entry,
              display = function()
                return string.format('%d. %s', index, entry)
              end,
              ordinal = entry,
              index = index,
            }
          end,
        }),
      })
    )
    :find()
end

return M
