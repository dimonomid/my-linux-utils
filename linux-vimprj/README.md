.vimprj for Linux Kernel
========================

This is a `.vimprj` setup which I use for Linux Kernel. For details on what's
`.vimprj` and how to use it properly, see: [Vim: convenient code navigation for your projects](https://dmitryfrank.com/articles/vim_project_code_navigation).

You can copy this dir as `.vimprj` into your kernel source tree, but I prefer
to have symlinks instead; there is a simple script which setups symlinks for
you:

```bash
bash setup_symlinks.sh /path/to/linux-kernel-source
```
