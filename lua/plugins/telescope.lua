local ok, actions = pcall(require, "telescope.actions")
if not ok then
    print "Could not require telescope actions. Check the config"
    return
end

require("telescope").setup({
    defaults = {
        file_ignore_patterns = {
            "bin/", "obj/", "%.o", "%.out", "node_modules/", ".git/", "target/",
            "_build", ".elixir_ls", "deps",
        },
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-s>"] = actions.file_split,
                ["<C-v>"] = actions.file_vsplit,
            },
            n = {
                ["<C-s>"] = actions.file_split,
            }
        },
    },
    pickers = {
        find_files = {
            hidden = true,
            no_ignore = true,
        }
    },
    extensions = {}
})

require("telescope").load_extension("fzf")

local no_preview = function()
    return require("telescope.themes").get_dropdown({
        borderchars = {
                      { "─",  "│", "─", "│", "┌", "┐", "┘", "└"},
            prompt  = { "─",  "│", " ", "│", "┌", "┐", "│", "│"},
            results = { "─",  "│", "─", "│", "├", "┤", "┘", "└"},
            preview = { "─",  "│", "─", "│", "┌", "┐", "┘", "└"},
        },
        width = 0.8,
        previewer = false,
        prompt_title = false
    })
end

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fg", builtin.live_grep)
vim.keymap.set("n", "<leader>fb", builtin.buffers)
vim.keymap.set("n", "<leader>fh", builtin.help_tags)
vim.keymap.set("n", "<leader>fd", builtin.diagnostics)
vim.keymap.set("n", "<leader>fk", builtin.keymaps)

vim.keymap.set("n", "<leader>fs", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

vim.keymap.set("n", "<C-f>", function()
    builtin.current_buffer_fuzzy_find(no_preview())
end)

vim.keymap.set("n", "<C-q>", function()
    builtin.find_files(no_preview())
end)
