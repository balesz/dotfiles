if pcall(require, "languages") then
  require("languages").dap_setup()
end

if pcall(require, "dapui") then
  require("dapui").setup {}
end
