-- load global env vars to nvim environment
--   so avante plugin stop asking for the api keys
local env_file = vim.fn.expand("~") .. '/.env.global'

-- Function to load .env into Neovim's environment
local function load_env(path)
  local file = io.open(path, "r")
  if not file then
    vim.notify("No .env file found at: " .. path, vim.log.levels.WARN)
    return
  end

  for line in file:lines() do
    -- skip comments and empty lines
    if line:match("^%s*#") == nil and line:match("%S") then
      local key, value = line:match('^%s*([%w_]+)%s*=%s*(.+)%s*$')
      if key and value then
        -- remove surrounding quotes if present
        value = value:gsub('^"(.-)"$', '%1')
        value = value:gsub("^'(.-)'$", '%1')
        vim.fn.setenv(key, value)
      end
    end
  end

  file:close()
  vim.notify(".env variables loaded", vim.log.levels.INFO)
end

-- Call it
load_env(env_file)
