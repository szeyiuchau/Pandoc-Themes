## Pandoc-Themes

This is a fork of [https://github.com/cab-1729/Pandoc-Themes](https://github.com/cab-1729/Pandoc-Themes).

### Changes

- Fixed a problem in `paradox-seraph.tex` in `orangeheart.tex` that makes them unable to work with sub-lists.

- Fixed the error regarding `CSLReferences`. One might encounter an error message `LaTeX Error: Environment CSLReferences undefined.` when the `--citeproc` option is used. 
    - The `--citeproc` option is not available on old versions of `pandoc`. This is not uncommon if one installs `pandoc` from `apt` on Debian-based systems. New versions can be fetched from [GitHub](https://github.com/jgm/pandoc/releases) directly.
        - I found that the GitHub release version has a default user data directory different from that of the `apt` version. To prevent `pandoc` from complaining about not being able to find the data/template files, one might want to symlink `~/.local/share/pandoc` to `/usr/share/pandoc/data`. Note that the link target is meant to be `/usr/share/pandoc/data`, not `/usr/share/pandoc`.

- Removed the background grid in `drake-juejin.tex`. Occasionally the grid color/opacity would be rendered incorrectly and thus interferes with the contents.
