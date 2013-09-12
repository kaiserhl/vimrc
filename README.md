vimerator
================================================================================

- users specify programming env, then a different configuration setting will be 
  used (DONE)

example:

    [common]
    plugin_path=./plugins
    conf_path=./conf

    [c]
    plugins=a.vim,authorinfo.vim,matchit,omnicppcomplete, ...
    configuration=vimrc.common.setting,vimrc.c.setting
    
    [c++]



configurations
----------------------------------------


plugins
----------------------------------------

### install ###

### deinstall ###



colors
----------------------------------------

### install ###

### deinstall ###


TODO
----------------------------------------
- rename `constructorXXX` to `installerXXX`

- add `common` plugins & confs options (done)

- supports `verbose` options (done)
