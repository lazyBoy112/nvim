local status, heirline = pcall(require, 'heirline')
if not status then return end
local conditions = require('heirline.conditions')
local utils = require('heirline.utils')
local tabLine = {}
local statusLine = {}
local colors = {
  black        = '#181920',
  red          = '#FA5F55',
  green        = '#8FCA9A',
  yellow       = '#F7EFAE',
  blue         = '#4a00aa',
  magenta      = '#BF40BF',
  cyan         = '#62ccc3',
  white        = '#708090',
  lightBlack   = '#414A5F',
  lightRed     = '#E39194',
  lightGreen   = '#32CD32',
  lightYellow  = '#EFAA8E',
  lightBlue    = '#77ABE7',
  lightMagenta = '#CAA6EC',
  lightCyan    = '#A2C6EF',
  lightWhite   = '#D3D3D3',
  superYellow  = '#ffff00',
  superRed     = '#ff0000',
  superGreen   = '#00ff00',
  superWhite   = '#ffffff',
}

heirline.load_colors(colors)

local ViMode = {
    init = function(self)
        self.mode = vim.fn.mode(1) -- :h mode()
    end,
    static = {
        mode_names = { -- change the strings if you like it vvvvverbose!
            n = "N ",
            no = "N? ",
            nov = "N? ",
            noV = "N? ",
            ["no\22"] = "N? ",
            niI = "Ni ",
            niR = "Nr ",
            niV = "Nv ",
            nt = "Nt ",
            v = "V ",
            vs = "Vs ",
            V = "Vl ",
            Vs = "Vs ",
            ["\22"] = "Vb",
            ["\22s"] = "^V",
            s = "S",
            S = "S_",
            ["\19"] = "^S",
            i = "I ",
            ic = "Ic",
            ix = "Ix",
            R = "R ",
            Rc = "Rc",
            Rx = "Rx",
            Rv = "Rv",
            Rvc = "Rv",
            Rvx = "Rv",
            c = "C ",
            cv = "Ex",
            r = "...",
            rm = "M",
            ["r?"] = "?",
            ["!"] = "!",
            t = "T ",
        },
        mode_colors = {
            n = "green" ,
            i = "lightBlue",
            v = "magenta",
            V =  "magenta",
            ["\22"] =  "magenta",
            c =  "orange",
            s =  "purple",
            S =  "purple",
            ["\19"] =  "purple",
            R =  "red",
            r =  "red",
            ["!"] =  "red",
            t =  "cyan",
        }
    },
    provider = function(self)
        return " %2("..self.mode_names[self.mode].."%)"
    end,
    -- Same goes for the highlight. Now the foreground will change according to the current mode.
    hl = function(self)
        local mode = self.mode:sub(1, 1) -- get only the first mode character
        return {fg=colors.black, bg = self.mode_colors[mode], bold = true, }
    end,
    -- Re-evaluate the component only on ModeChanged event!
    -- Also allows the statusline to be re-evaluated when entering operator-pending mode
    update = {
        "ModeChanged",
        pattern = "*:*",
        callback = vim.schedule_wrap(function()
            vim.cmd("redrawstatus")
        end),
    },
}
local SepMode = {
    init = function(self)
        self.mode = vim.fn.mode(1) -- :h mode()
    end,
    static = {
        mode_names = { -- change the strings if you like it vvvvverbose!
            n = "N ",
            no = "N? ",
            nov = "N? ",
            noV = "N? ",
            ["no\22"] = "N? ",
            niI = "Ni ",
            niR = "Nr ",
            niV = "Nv ",
            nt = "Nt ",
            v = "V ",
            vs = "Vs ",
            V = "Vl ",
            Vs = "Vs ",
            ["\22"] = "Vb",
            ["\22s"] = "^V",
            s = "S",
            S = "S_",
            ["\19"] = "^S",
            i = "I ",
            ic = "Ic",
            ix = "Ix",
            R = "R ",
            Rc = "Rc",
            Rx = "Rx",
            Rv = "Rv",
            Rvc = "Rv",
            Rvx = "Rv",
            c = "C ",
            cv = "Ex",
            r = "...",
            rm = "M",
            ["r?"] = "?",
            ["!"] = "!",
            t = "T ",
        },
        mode_colors = {
            n = "green" ,
            i = "lightBlue",
            v = "magenta",
            V =  "magenta",
            ["\22"] =  "magenta",
            c =  "orange",
            s =  "purple",
            S =  "purple",
            ["\19"] =  "purple",
            R =  "red",
            r =  "red",
            ["!"] =  "red",
            t =  "cyan",
        }
    },
    provider = function(self)
        return ""
    end,
    hl = function(self)
        local mode = self.mode:sub(1, 1) -- get only the first mode character
        return {fg = self.mode_colors[mode], bg = 'none'}
    end,
    update = {
        "ModeChanged",
        pattern = "*:*",
        callback = vim.schedule_wrap(function()
            vim.cmd("redrawstatus")
        end),
    },
}

local FileNameBlock = {
    init = function(self)
        self.filename = vim.api.nvim_buf_get_name(0)
    end,
}
local FileIcon = {
    init = function(self)
        local filename = self.filename
        local extension = vim.fn.fnamemodify(filename, ":e")
        self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color(filename, extension, { default = true })
    end,
    provider = function(self)
        return self.icon and (' '..self.icon .. " ")
    end,
    hl = function(self)
        return { fg = self.icon_color }
    end
}
local FileName = {
    provider = function(self)
        -- first, trim the pattern relative to the current directory. For other
        -- options, see :h filename-modifers
        local filename = vim.fn.fnamemodify(self.filename, ":.")
        if filename == "" then return "[No Name]" end
        -- now, if the filename would occupy more than 1/4th of the available
        -- space, we trim the file path to its initials
        -- See Flexible Components section below for dynamic truncation
        if not conditions.width_percent_below(#filename, 0.25) then
            filename = vim.fn.pathshorten(filename)
        end
        return filename
    end,
    hl = { fg = utils.get_highlight("Directory").fg },
}
local FileType = {
    provider = function()
        return string.upper(vim.bo.filetype)
    end,
    hl = { fg = colors.lightGreen, bg='none', bold = true },
}
local FileFlags = {
    {
        condition = function()
            return vim.bo.modified
        end,
        provider = "[+]",
        hl = { fg = colors.lightGreen },
    },
    {
        condition = function()
            return not vim.bo.modifiable or vim.bo.readonly
        end,
        provider = "",
        hl = { fg = colors.lightRed },
    },
}
local FileNameModifer = {
    hl = function()
        if vim.bo.modified then
            -- use `force` because we need to override the child's hl foreground
            return { fg = "cyan", bold = true, force=true }
        end
    end,
}

local FileEncoding = {
    provider = function()
        local enc = (vim.bo.fenc ~= '' and vim.bo.fenc) or vim.o.enc -- :h 'enc'
        return enc ~= 'utf-8' and enc:upper()
    end
}

local FileFormat = {
    provider = function()
        local fmt = vim.bo.fileformat
        return fmt ~= 'unix' and fmt:upper()
    end,
}

-- let's add the children to our FileNameBlock component
FileNameBlock = utils.insert(FileNameBlock,
    FileIcon,
    FileType,
    --utils.insert(FileNameModifer, FileName), -- a new table where FileName is a child of FileNameModifier
    FileFlags,
    { provider = '%<'} -- this means that the statusline is cut here when there's not enough space
)

local FileSize = {
    provider = function()
        -- stackoverflow, compute human readable file size
        local suffix = { 'b', 'k', 'M', 'G', 'T', 'P', 'E' }
        local fsize = vim.fn.getfsize(vim.api.nvim_buf_get_name(0))
        fsize = (fsize < 0 and 0) or fsize
        if fsize < 1024 then
            return fsize..suffix[1]
        end
        local i = math.floor((math.log(fsize) / math.log(1024)))
        return string.format("%.2g%s", fsize / (1024^i), suffix[i + 1])
    end
}
local FileLastModified = {
    -- did you know? Vim is full of functions!
    provider = function()
        local ftime = vim.fn.getftime(vim.api.nvim_buf_get_name(0))
        return (ftime > 0) and os.date("%H:%M %d/%m/%y", ftime)
    end
}
local getModifiedTime = function ()
    local ftime = vim.fn.getftime(vim.api.nvim_buf_get_name(0))
    print(os.date("%H:%M %d/%m/%y", ftime))
end

local Ruler = {
    -- %l = current line number
    -- %L = number of lines in the buffer
    -- %c = column number
    -- %P = percentage through file of displayed window
    provider = " %7(%l/%3L%):%2c ",
    hl = {fg=colors.cyan, bg=colors.lightBlack, bold=true},
}
local ScrollBar ={
    static = {
        sbar = {'█' ,'▇' ,'▆' ,'▅' ,'▄' ,'▃' ,'▂' ,'▁'  }
        --sbar = { '🭶', '🭷', '🭸', '🭹', '🭺', '🭻' } 
    },
    provider = function(self)
        local curr_line = vim.api.nvim_win_get_cursor(0)[1]
        local lines = vim.api.nvim_buf_line_count(0)
        local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
        return string.rep(self.sbar[i], 2)
    end,
    hl = { fg = colors.lightBlue, bg = colors.lightBlack },
}
local LSPActive = {
    condition = conditions.lsp_attached,
    update = {'LspAttach', 'LspDetach'},

    -- You can keep it simple,
    -- provider = " [LSP]",

    -- Or complicate things a bit and get the servers names
    provider  = function()
        local names = {}
        for i, server in pairs(vim.lsp.get_active_clients({ bufnr = 0 })) do
            table.insert(names, server.name)
        end
        return " " .. table.concat(names, " ")
    end,
    hl = { fg = "green", bold = true },
}
local Diagnostics = {
    condition = conditions.has_diagnostics,
    static = {
        error_icon = vim.fn.sign_getdefined("DiagnosticSignError")[1].text,
        warn_icon = vim.fn.sign_getdefined("DiagnosticSignWarn")[1].text,
        info_icon = vim.fn.sign_getdefined("DiagnosticSignInfo")[1].text,
        hint_icon = vim.fn.sign_getdefined("DiagnosticSignHint")[1].text,
    },

    init = function(self)
        self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
        self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
        self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
        self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
    end,

    update = { "DiagnosticChanged", "BufEnter" },
    {
        provider = function(self)
            -- 0 is just another output, we can decide to print it or not!
            return self.errors > 0 and (self.error_icon .. self.errors .. " ")
        end,
        hl = { fg = colors.red },
    },
    {
        provider = function(self)
            return self.warnings > 0 and (self.warn_icon .. self.warnings .. " ")
        end,
        hl = { fg = colors.yellow },
    },
    {
        provider = function(self)
            return self.info > 0 and (self.info_icon .. self.info .. " ")
        end,
        hl = { fg = colors.white },
    },
    {
        provider = function(self)
            return self.hints > 0 and (self.hint_icon .. self.hints)
        end,
        hl = { fg = colors.green },
    },
}
local Git = {
    condition = conditions.is_git_repo,
    init = function(self)
        self.status_dict = vim.b.gitsigns_status_dict
        self.has_changes = self.status_dict.added ~= 0 or self.status_dict.removed ~= 0 or self.status_dict.changed ~= 0
    end,
    hl = { fg = colors.lightYellow, bg='none', bold=true },
    {   -- git branch name
        provider = function(self)
            return " " .. self.status_dict.head
        end,
        hl = { bold = true }
    },
    -- You could handle delimiters, icons and counts similar to Diagnostics
    {
        condition = function(self)
            return self.has_changes
        end,
        provider = "("
    },
    {
        provider = function(self)
            local count = self.status_dict.added or 0
            return count > 0 and ("+" .. count)
        end,
        hl = { fg = colors.superGreen, bg='none' },
    },
    {
        provider = function(self)
            local count = self.status_dict.removed or 0
            return count > 0 and ("-" .. count)
        end,
        hl = { fg = colors.superRed },
    },
    {
        provider = function(self)
            local count = self.status_dict.changed or 0
            return count > 0 and ("~" .. count)
        end,
        hl = { fg = colors.superYellow, bg='none' },
    },
    {
        condition = function(self)
            return self.has_changes
        end,
        provider = ")",
    },
}
local DAPMessages = {
    condition = function()
        local session = require("dap").session()
        return session ~= nil
    end,
    provider = function()
        return " " .. require("dap").status()
    end,
    hl = "Debug"
    -- see Click-it! section for clickable actions
}
local UltTest = {
    condition = function()
        return vim .api.nvim_call_function("ultest#is_test_file", {}) ~= 0
    end,
    static = {
        --passed_icon = vim.fn.sign_getdefined("test_pass")[1].text,
        --failed_icon = vim.fn.sign_getdefined("test_fail")[1].text,
        --passed_hl = { fg = utils.get_highlight("UltestPass").fg },
        --failed_hl = { fg = utils.get_highlight("UltestFail").fg },
    },
    init = function(self)
        self.status = vim.api.nvim_call_function("ultest#status", {})
    end,

    -- again, if you'd like icons and numbers to be colored differently,
    -- just split the component in two
    {
        provider = function(self)
            return self.passed_icon .. self.status.passed .. " "
        end,
        hl = function(self)
            return self.passed_hl
        end,
    },
    {
        provider = function(self)
            return self.failed_icon .. self.status.failed .. " "
        end,
        hl = function(self)
            return self.failed_hl
        end,
    },
    {
        provider = function(self)
            return "of " .. self.status.tests - 1
        end,
    },
}
local SearchCount = {
    condition = function()
        return vim.v.hlsearch ~= 0 and vim.o.cmdheight == 0
    end,
    init = function(self)
        local ok, search = pcall(vim.fn.searchcount)
        if ok and search.total then
            self.search = search
        end
    end,
    provider = function(self)
        local search = self.search
        return string.format(" %d/%d ", search.current, math.min(search.total, search.maxcount))
    end,
    hl = { fg = colors.lightBlue, bg='none', bold=true },
}
local Align = { provider = "%=", hl = {bg='none'} }
local Space = { provider = " ", hl = {bg='none' } }
local lspStatus = {
  provider = function()
    local lsp = vim.lsp.util.get_progress_messages()[1]
	if lsp then
		local name = lsp.name or ""
		local msg = lsp.message or ""
		local percentage = lsp.percentage or 0
		local title = lsp.title or ""
		return string.format("%s %s (%s%%%%) ", title, msg, percentage)
	end
	return ""
  end,
  hl = { fg=colors.red, bg='none' },
}

statusLine = {
  ViMode, SepMode, Space,
  Git,
  FileNameBlock, Align,
  -- lspStatus,
  SearchCount, Space,
  Diagnostics, Space,
  LSPActive, Space,
  --DAPMessages,
  -- UltTest,
  { provider = '', hl = {fg=colors.lightBlack, bg='none' }},
  Ruler,
  ScrollBar
}

local winBar = {
  {},
  {},
}

local TablineBufnr = {
    provider = function(self)
        return tostring(self.bufnr) .. ". "
    end,
    hl = {bg=colors.black},
}

-- we redefine the filename component, as we probably only want the tail and not the relative path
local TablineFileName = {
    provider = function(self)
        -- self.filename will be defined later, just keep looking at the example!
        local filename = self.filename
        filename = filename == "" and "[No Name]" or vim.fn.fnamemodify(filename, ":t")
        return filename
    end,
    hl = function(self)
        return { bold = self.is_active or self.is_visible, italic = true }
    end,
}

local TablineFileFlags = {
    {
        condition = function(self)
            return vim.api.nvim_buf_get_option(self.bufnr, "modified")
        end,
        provider = "[+]",
        hl = { fg = colors.red },
    },
    {
        condition = function(self)
            return not vim.api.nvim_buf_get_option(self.bufnr, "modifiable")
                or vim.api.nvim_buf_get_option(self.bufnr, "readonly")
        end,
        provider = function(self)
            if vim.api.nvim_buf_get_option(self.bufnr, "buftype") == "terminal" then
                return "  "
            else
                return ""
            end
        end,
        hl = { fg = colors.green },
    },
}

-- Here the filename block finally comes together
local TablineFileNameBlock = {
    init = function(self)
        self.filename = vim.api.nvim_buf_get_name(self.bufnr)
    end,
    hl = function(self)
      if self.is_active then
          return {bg=colors.black}
      else
          return {bg=colors.lightBlack}
      end
    end,
    on_click = {
        callback = function(_, minwid, _, button)
            if (button == "m") then -- close on mouse middle click
                vim.schedule(function()
                    vim.api.nvim_buf_delete(minwid, { force = false })
                end)
            else
                vim.api.nvim_win_set_buf(0, minwid)
            end
        end,
        minwid = function(self)
            return self.bufnr
        end,
        name = "heirline_tabline_buffer_callback",
    },
    FileIcon, -- turns out the version defined in #crash-course-part-ii-filename-and-friends can be reutilized as is here!
    TablineFileName,
    TablineFileFlags,
}

local TablineCloseButton = {
    condition = function(self)
        return not vim.api.nvim_buf_get_option(self.bufnr, "modified")
    end,
    { provider = " ", 
      hl = function (self)
        if self.is_active then
          return {  bg=colors.black }
        else
          return {  bg=colors.lightBlack }
        end
      end,
    },
    {
        provider = "󰅖 ",
        --hl = { fg = colors.white},
        hl = function (self)
          if self.is_active then
            return { fg= colors.white, bg=colors.black }
          else
            return { fg= colors.white, bg=colors.lightBlack }
          end
        end,
        on_click = {
            callback = function(_, minwid)
                vim.schedule(function()
                    vim.api.nvim_buf_delete(minwid, { force = false })
                    vim.cmd.redrawtabline()
                end)
            end,
            minwid = function(self)
                return self.bufnr
            end,
            name = "heirline_tabline_close_buffer_callback",
        },
    },
}

-- The final touch!
local TablineBufferBlock = utils.surround({ "󰉁", "" }, function(self)
    if self.is_active then
        return colors.lightBlack
    else
        return colors.black
    end
end, { TablineFileNameBlock, TablineCloseButton })

local get_bufs = function()
    return vim.tbl_filter(function(bufnr)
        return vim.api.nvim_buf_get_option(bufnr, "buflisted")
    end, vim.api.nvim_list_bufs())
end

local buflist_cache = {}

vim.api.nvim_create_autocmd({ "VimEnter", "UIEnter", "BufAdd", "BufDelete" }, {
    callback = function()
        vim.schedule(function()
            local buffers = get_bufs()
            for i, v in ipairs(buffers) do
                buflist_cache[i] = v
            end
            for i = #buffers + 1, #buflist_cache do
                buflist_cache[i] = nil
            end

            -- check how many buffers we have and set showtabline accordingly
            if #buflist_cache > 1 then
                vim.o.showtabline = 2 -- always
            else
                vim.o.showtabline = 1 -- only when #tabpages > 1
            end
        end)
    end,
})

tabLine = utils.make_buflist(
    TablineBufferBlock,
    { provider = " ", hl = { fg = colors.lightBlue, bg=colors.lightBlack } },
    { provider = " ", hl = { fg = colors.lightBlue, bg=colors.lightBlack } },
    function()
        return buflist_cache
    end,
    false
)

vim.o.showtabline = 2
vim.cmd([[au FileType * if index(['wipe', 'delete'], &bufhidden) >= 0 | set nobuflisted | endif]])

heirline.setup({
  statusline = statusLine,
  tabline = tabLine,
  opts = {},
})
