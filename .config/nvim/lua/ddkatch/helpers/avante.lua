function use_openai()
  return {
    provider = "openai",                    -- The LLM provider ("openai")
    endpoint = "https://api.openai.com/v1", -- The LLM API endpoint
    api_key = "OPENAI_API_KEY",             -- The environment variable name for the LLM API key
    model = "gpt-4o",                       -- The LLM model name (e.g., "gpt-4o-mini", "gpt-3.5-turbo")
    extra = {                               -- Extra configuration options for the LLM (optional)
      temperature = 0.2,                    -- Controls the randomness of the output. Lower values make it more deterministic.
      max_tokens = 8192,                    -- The maximum number of tokens to generate in the completion.
      -- system_prompt = "You are a helpful assistant.", -- A system prompt to guide the model's behavior.
      -- timeout = 120, -- Request timeout in seconds.
    }
  }
end

function use_proxy_ollama()
  -- uses local proxy before ollama with anthropic-like behavior to enable tools calling
  return {
    claude = {
      endpoint = "http://127.0.0.1:5055", -- your Sinatra base; Avante will POST /v1/messages
      api_key_name = "ANTHROPIC_API_KEY", -- Avante insists on this header; value can be anything
      model = "hhao/qwen2.5-coder-tools:7b",
      -- you can keep tools enabled (default); our shim handles tool_use/tool_result
      timeout = 3000,
    },
  }
end

function use_ollama()
  return {
    ollama = {
      endpoint = "http://127.0.0.1:5055", -- Note that there is no /v1 at the end.
      -- endpoint = "http://127.0.0.1:5050", -- Note that there is no /v1 at the end.
      -- endpoint = "http://127.0.0.1:11434", -- Note that there is no /v1 at the end.
      model = "qwen2.5-coder:7b",
    },
  }
end

function use_claude()
  return {
    -- add any opts here
    -- for example
    claude = {
      endpoint = "https://api.anthropic.com/v1/messages",
      model = "claude-3-7-sonnet-20250219", -- your desired model (or use gpt-4o, etc.)
      api_key = "ANTHROPIC_API_KEY",
      timeout = 30000,                      -- Timeout in milliseconds, increase this for reasoning models
      temperature = 0,
      max_tokens = 8192,                    -- Increase this to include reasoning tokens (for reasoning models)
      --reasoning_effort = "medium", -- low|medium|high, only used for reasoning models
    },
  }
end

function avante_lazy_config()
  return {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false, -- Never set this value to "*"! Never!
    opts = {
      providers = use_proxy_ollama()
    },
    -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
    build = "make",
    -- build = "powershell -ExecutionPolicy Bypass -File Build.ps1 -BuildFromSource false" -- for windows
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      -- "echasnovski/mini.pick",       -- for file_selector provider mini.pick
      -- "nvim-telescope/telescope.nvim", -- for file_selector provider telescope
      -- "hrsh7th/nvim-cmp",            -- autocompletion for avante commands and mentions
      -- "ibhagwan/fzf-lua",            -- for file_selector provider fzf
      -- "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      -- "zbirenbaum/copilot.lua",      -- for providers='copilot'
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  }
end
