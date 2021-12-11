local present, packer = pcall(require, "packer")

local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(install_path)) > 0 and not present then
    vim.fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    })

    if pcall(require, "packer") then
        print("Installed packer successfully!")
    else
        error("Something's gone wrong.")
    end
end

-- packer init
return packer.init({
    compile_path = vim.fn.stdpath("config") .. "/lua/packer_compiled.lua",
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
        prompt_border = "rounded", -- Border style of prompt popups.
    },
})