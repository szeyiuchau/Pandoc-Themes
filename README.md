## Pandoc-Themes

This is a fork of [https://github.com/cab-1729/Pandoc-Themes](https://github.com/cab-1729/Pandoc-Themes), which contains several bug fixes and scripts that worked for me. YMMV.

### Test setup

Tested on Ubuntu 20.04 with TeX Live 2022 full installation and `pandoc` v2.19.2. 

### Changes

- Fixed a problem in `paradox-seraph.tex` in `orangeheart.tex` that makes them unable to work with sub-lists.

- Fixed the error regarding `CSLReferences`. When the `--citeproc` option is used, one might encounter an error message `LaTeX Error: Environment CSLReferences undefined.` ~~The fix is based on [this comment](https://github.com/rstudio/rmarkdown/issues/1649#issuecomment-717176839), which is also discussed [here](https://stackoverflow.com/questions/59193797/pandocs-environment-cslreferences-undefined-when-knitting-rmarkdown-to-pdf-in-r).~~ Plotting the lines defining the `CSLReferences` and other related commands from the [eisvogel](https://github.com/Wandmalfarbe/pandoc-latex-template) template gives better support to styling with CSL files, especially when we prefer numeric styles commonly used by the likes of IEEE and ACM.
    - CSL files can be previewed and downloaded from the [Zotero Style Repository](https://www.zotero.org/styles).
    - Note the `--citeproc` option is not available on old versions of `pandoc`. This is not uncommon if one installs `pandoc` from `apt` on Debian-based systems. New versions can be fetched from [GitHub](https://github.com/jgm/pandoc/releases) directly.
        - I found that the GitHub release version has a default user data directory different from that of the `apt` version. To prevent `pandoc` from complaining about not being able to find the data/template files, one might want to symlink `~/.local/share/pandoc` to `/usr/share/pandoc/data`. Note that the link target is meant to be `/usr/share/pandoc/data`, not `/usr/share/pandoc`.

- Removed the background grid in `drake-juejin.tex`. Occasionally the grid color/opacity would be rendered incorrectly and thus interferes with the contents.

- Adding the [eisvogel](https://github.com/Wandmalfarbe/pandoc-latex-template) template, and fixed its strikethrough (`\sout`) problem by adding `\usepackage[normalem]{ulem}` to it.
