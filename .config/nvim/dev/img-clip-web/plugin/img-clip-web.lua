local plugin = require("img-clip-web")

vim.api.nvim_create_user_command("PasteImageWeb", function()
    plugin.paste_image()
end, {})
