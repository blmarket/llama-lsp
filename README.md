Autostart llama.cpp on nvim
----------------------------

Script to autostart llama.cpp on neovim

## Disclaimer

Bunch of contents are generated by Qwen model called from llama.vim, so author
does not take any responsibility for the incorrect contents.

## What it does?

1. It autostarts llama.cpp when you open neovim
2. For multiple neovim editors, they will share the same llama.cpp process
3. It closes the llama.cpp process 30 seconds after you close the last neovim
   editor.

## Why?

Let's say you tried
[llama.vim](https://github.com/ggml-org/llama.vim)
and had a good experience.

So now it's time to think about how to use it daily basis without worrying about
the launching llama-server process.

## How to use

Add this line to your init.vim

```vim
  :lua vim.lsp.start({ name = 'llama-lsp', cmd = { '/home/blmarket/proj/llama-lsp/target/release/llama-lsp', }, })
```

(It means you need to build llm-lsp first)

## Another disclaimer

As you see bunch of things are hardcoded for my own use.

It will consume about 16.8GB of VRAM, so you may need nVidia x090 to run this. 
(It's your homework to change the model to smaller one)
