PDF Documentation Generator
===========================

This is a makefile which can generate plain pdf files from *.txt and *.rst
files with the formatting preserved, i.e. without any fancy rendering. I need
this to be able to read Linux Kernel documentation comfortably on my ebook
reader (Pocketbook Pro 902), which apparently sucks at rendering text files: it
tries to be smart about formatting, and there's no way (which I know of) to
just show text file as it is. So I had to convert those text files to pdfs. Sad
but true.

With respect to *.rst files, obviously it would be better to generate a proper
output with sphinx, but at the moment I failed to make `make pdfdocs` work for
me in the reasonable timeslice, so I gave up and just convert them as *.txt.

Usage:

```
make -j DOC_SRC_PATH=/path/to/linux-kernel-source/Documentation
```

The output pdfs are saved to `output` dir, with the directory hierarchy
preserved.
