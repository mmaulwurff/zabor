# Zabor

```
 __  __  __  __  __
/  \/  \/  \/  \/  \
|  ||  ||  ||  ||  |
|..||..||..||..||..|
|..||..||..||..||..|
| Z|| a|| b|| o|| r|
|__||__||__||__||__|
```

Zabor is VM abort handler for GZDoom. It is both a script library and a
standalone add-on.

This mod is a part of [m8f's toolbox](https://mmaulwurff.github.io/pages/toolbox).

## Features

When VM abort happens, Zabor prints:
- basic game information: map name, total time, multiplayer status, player
  class, skill;
- game configuration: compat flags, dm flags, autoaim;
- event handler list;
- a request for the user to report the VM abort;
- instructions for taking a screenshot.
