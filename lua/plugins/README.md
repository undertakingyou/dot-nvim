# Plugins directory

All plugins (files ending with .lua) will be loaded into the init.lua file and installed as a plugin.
We use Lazy for plugin management.

## Details 
To check the current status of your plugins, run
  `:Lazy`

You can press `?` in this menu for help. Use `:q` to close the window

To update plugins you can run
  `:Lazy update`

Plugins can be added with a link (or for a github repo: 'owner/repo' link).
Plugins can also be added by using a table, with the first argument being the link
and the following keys can be used to configure plugin behavior/loading/etc.

Use `opts = {}` to automatically pass options to a plugin's `setup()` function, forcing the plugin to be loaded.

Alternatively, use `config = function() ... end` for full control over the configuration.
If you prefer to call `setup` explicitly, use:
```
  {
      'lewis6991/gitsigns.nvim',
      config = function()
          require('gitsigns').setup({
              -- Your gitsigns configuration here
          })
      end,
  }
```

Plugins can also be configured to run Lua code when they are loaded.

This is often very useful to both group configuration, as well as handle
lazy loading plugins that don't need to be loaded immediately at startup.

For example, in the whichkey.lua configuration, we use:
    `event = 'VimEnter'`

which loads which-key before all the UI elements are loaded. Events can be
normal autocommands events (`:help autocmd-events`).

Then, because we use the `opts` key (recommended), the configuration runs
after the plugin has been loaded as `require(MODULE).setup(opts)`.
