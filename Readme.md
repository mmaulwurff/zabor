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

![screenshot](screenshots/screenshot1.png)

This mod is a part of [m8f's toolbox](https://mmaulwurff.github.io/pages/toolbox).

## Features

When VM abort happens, Zabor prints:
- basic game information: map name, total time, multiplayer status, player
  class, skill;
- game configuration: compat flags, dm flags, autoaim;
- event handler list;
- a request for the user to report the VM abort;
- instructions for taking a screenshot.

If there are several Zabor-based handlers loaded, only the first one will print
stuff. For this to work, all handlers must have "VmAbortHandler" somewhere in
their class name.

## How to use

### As a standalone add-on

Simply load zabor-v*.pk3 with other mods. Wait for an abort. You can test that
it works with the following command: `error welp`.

### As a script library

1. Copy zr_VmAbortHandler class from zscript.zs to your mod.
2. Change `zr_` to something unique. Please make sure that `VmAbortHandler` part
   of the name remains intact.
3. Add this event handler to `gameinfo` section in `mapinfo` lump like this:
```
gameinfo
{
  AddEventHandlers = "my_VmAbortHandler"
}
```

## Acknowledgments

- Thanks to KeksDose for the concept of VM abort handler.
