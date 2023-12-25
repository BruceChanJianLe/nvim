vim.g.mapleader = " "
-- project view
vim.keymap.set("n", "<leader>pv", "<cmd>Neotree focus <CR>", { desc = '[P]roject [V]iew' })
vim.keymap.set({ "n", "i" }, "<C-b>", "<cmd>Neotree toggle<CR><Esc>", { desc = 'Follow vscode convention' })

-- move entire line in visual mode
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = 'move entire line down in visual mode' })
vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = 'move entire line up in visual mode' })

vim.keymap.set("n", "<A-j>", ":m .+1<CR>==", { desc = 'move entire line down in normal mode' })
vim.keymap.set("n", "<A-k>", ":m .-2<CR>==", { desc = 'move entire line up in normal mode' })

vim.keymap.set("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = 'move entire line down in insert mode' })
vim.keymap.set("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = 'move entire line up in insert mode' })

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
-- Keep cursor center after jumping to bottom
vim.keymap.set("n", "G", "Gzz")
-- keep cursor in middle while searching
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever, paste without yank
vim.keymap.set("x", "<leader>p", [["_dP]])

-- yank to system buffer
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
-- delete to system buffer
vim.keymap.set({ "n", "v" }, "<leader>d", [["+d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

-- do nothing for Q
vim.keymap.set("n", "Q", "<nop>")
-- start a new project
-- vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>") -- Not in used
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- quick fix list navigation
vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")

-- location list navigation (has conflict with jumping panes settings)
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- handy search and replace
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = 'Search and [R]eplace Text Under Cursor' })
vim.keymap.set("v", "<leader>r", [["hy<CR>:%s/<C-r>h/<C-r>h/gI<Left><Left><Left>]], { desc = 'Search and [R]eplace Current Highlighted Text' })
vim.keymap.set("v", "<C-R>", [[:s/\%V\//gI<Left><Left><Left><Left>]], { desc = 'Search and [R]eplace for Input in Highlighted Text' })
-- :'<,'>s/\%V\d\+/\=submatch(0)+1/g -- Saved for future reference (increment numbers by 1 in the entire line)
-- find and replace in quick fix
vim.keymap.set("v", "<leader><C-R>", [["hy<CR>:cdo %s/<C-r>h//gI<Left><Left><Left>]], { desc = '[C]do [R]eplace Visual Mode' })
vim.keymap.set("n", "<leader><C-R>", [["hyiw<CR>:cdo %s/<C-r>h//gI<Left><Left><Left>]], { desc = '[C]do [R]eplace Normal Mode' })
vim.keymap.set("n", "<leader>@", [[:cdo norm @]], { desc = 'Cdo replace with [@] macro' })
-- References
-- https://stackoverflow.com/questions/676600/vim-search-and-replace-selected-text (READ)
-- https://vim.fandom.com/wiki/Search_for_visually_selected_text
-- https://vi.stackexchange.com/questions/20077/automatically-highlight-all-occurrences-of-the-selected-text-in-visual-mode
-- https://superuser.com/questions/41378/how-to-search-for-selected-text-in-vim
-- getting text for visually selected text (https://stackoverflow.com/questions/1533565/how-to-get-visually-selected-text-in-vimscript)

-- make current file executable
vim.keymap.set("n", "<leader><leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- set filetype
vim.keymap.set("n", "<leader>s", ":se ft=")

-- save all files
vim.keymap.set("n", "<leader>w", ":wa<CR>")
vim.keymap.set("v", "<leader>w", ":<BS><BS><BS><BS><BS>wa<CR>gv", { desc = 'Sudo save, hence, the exclamation!' })
vim.keymap.set("n", "<leader>W", ":w !sudo tee %")

-- revert edit
vim.keymap.set("n", "<leader>e", ":e!<CR>")

-- quit / quit! (all)
vim.keymap.set("n", "<leader>q", ":q<CR>")
vim.keymap.set("n", "<leader>Q", ":qa!<CR>")
vim.keymap.set("v", "<leader>q", ":<BS><BS><BS><BS><BS>q<CR>")
vim.keymap.set("v", "<leader>Q", ":<BS><BS><BS><BS><BS>qa!<CR>")

-- save and quit (all)
vim.keymap.set("n", "<leader>x", ":x<CR>")
vim.keymap.set("n", "<leader>X", ":xa<CR>")

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

vim.keymap.set({"n", "v"}, "<A-z>", ":lua ToggleTextWrap()<CR>")
vim.keymap.set("i", "<A-z>", "<Esc>:lua ToggleTextWrap()<CR>a")

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

vim.keymap.set("n", "<leader><leader>p", ":lua TogglePasteFormat()<CR>")

-- jumping between panes
vim.keymap.set("n", "<leader>h", ":wincmd h<CR>")
vim.keymap.set("n", "<leader>j", ":wincmd j<CR>")
vim.keymap.set("n", "<leader>k", ":wincmd k<CR>")
vim.keymap.set("n", "<leader>l", ":wincmd l<CR>")

-- stay in visual mode while indenting
vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

-- increment and decrement from beginning of line
vim.keymap.set("n", "<A-a>", "?\\d<CR>")
vim.keymap.set("n", "<A-x>", "?\\d")

-- append lines in insert mode
vim.keymap.set("n", "<leader>o", "mpo<esc>`p")
vim.keymap.set("n", "<leader>O", "mpO<esc>`p")

-- Resize Windows
vim.keymap.set({ "n", "v" }, "<C-Left>",  "<C-w><")
vim.keymap.set({ "n", "v" }, "<C-Right>", "<C-w>>")
vim.keymap.set({ "n", "v" }, "<C-Down>",  "<C-w>+")
vim.keymap.set({ "n", "v" }, "<C-Up>",    "<C-w>-")

-- toggle split zoom
IS_ZOOM = false
function ToggleZoom()
  if (IS_ZOOM) then
    vim.api.nvim_command("norm =")
    print("Zoom Out")
    IS_ZOOM = false
  else
    vim.api.nvim_command("norm _|")
    print("Zoom In")
    IS_ZOOM = true
  end
end
vim.keymap.set("n", "<leader>z", ":lua ToggleZoom()<CR>")

vim.keymap.set("i", "<C-l>", "<Right>")
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<A-l>", "<C-Right>")
vim.keymap.set("i", "<A-h>", "<C-Left>")
-- Backspace entire word
vim.keymap.set("i", "<M-BS>", "<C-W>")
