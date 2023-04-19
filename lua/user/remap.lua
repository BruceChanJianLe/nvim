vim.g.mapleader = " "
-- project view
vim.keymap.set("n", "<leader>pv", vim.cmd.Lex, { desc = '[P]roject [V]iew' })
vim.g.netrw_winsize = 30
-- vim.keymap.set("n", "<C-E>", vim.cmd.Lex, { desc = 'follow vscode shortcut' }) -- until nerdtree

-- move entire line in visual mode
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = 'move entire line down in visual mode'})
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = 'move entire line up in visual mode'})

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = 'move entire line down in normal mode'})
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = 'move entire line up in normal mode'})

vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = 'move entire line down in insert mode'})
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = 'move entire line up in insert mode'})

-- vim.keymap.set("x", "J", ":m '>+1<CR>gv-gv")
-- vim.keymap.set("x", "K", ":m '<-2<CR>gv-gv")
-- vim.keymap.set("x", "<A-j>", ":m '>+1<CR>gv-gv")
-- vim.keymap.set("x", "<A-k>", ":m '<-2<CR>gv-gv")
-- ref: https://vim.fandom.com/wiki/Moving_lines_up_or_down#:~:text=In%20normal%20mode%20or%20in,to%20move%20the%20block%20up.

-- keep cursor pose for appending lines
vim.keymap.set("n", "J", "mzJ`z")
-- Keep cursor center for page up and down
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- keep cursor in middle while searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever, paste without yank
vim.keymap.set("x", "<leader>p", [["_dP]])

-- yank to system buffer
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- delete to system buffer
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

-- do nothing for Q
vim.keymap.set("n", "Q", "<nop>")
-- start a new project
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- quick fix list navigation
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")

-- location list navigation (has conflict with jumping panes settings)
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- handy search and replace
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- make current file executable
vim.keymap.set("n", "<leader><leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- set syntax
vim.keymap.set("n", "<leader>s", ":se syn=")

-- save all files
vim.keymap.set("n", "<leader>w", ":wa<CR>")

-- revert edit
vim.keymap.set("n", "<leader>e", ":e!<CR>")

-- quit / quit!
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>Q", ":q!<CR>")

-- save and quit
vim.keymap.set("n", "<leader>x", ":x<CR>")

-- toggle line number
function ToggleLineNumber()
    if (vim.o.number and vim.o.relativenumber) then
        vim.o.number = false
        vim.o.relativenumber = false
        print("Toggle line numbers OFF")
    else
        vim.o.number = true
        vim.o.relativenumber = true
        print("Toggle line numbers ON")
    end
end

vim.keymap.set("n", "<leader>n", ":lua ToggleLineNumber()<CR>")

-- toggele line wrap
function ToggleTextWrap()
    if (vim.o.wrap) then
        vim.o.wrap = false
        print("Toggle test wrap OFF")
    else
        vim.o.wrap = true
        print("Toggle test wrap ON")
    end
end

vim.keymap.set("n", "<leader><leader>z", ":lua ToggleTextWrap()<CR>")

-- toggle paste format
function TogglePasteFormat()
    if (vim.o.paste) then
        vim.o.paste = false
        print("Toggle paste format OFF")
    else
        vim.o.paste = true
        print("Toggle paste format ON")
    end
end

vim.keymap.set("n", "<leader><leader>p", ":lua TogglePasteFormat()ToggleTextWrap<CR>")

-- jumping between panes
vim.keymap.set("n", "<leader>h", ":wincmd h<CR>")
vim.keymap.set("n", "<leader>j", ":wincmd j<CR>")
vim.keymap.set("n", "<leader>k", ":wincmd k<CR>")
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>")

-- stay in visual mode while indenting
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

