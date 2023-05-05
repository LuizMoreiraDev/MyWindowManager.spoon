# MyWindowManager Spoon

A lightweight window management Spoon for Hammerspoon.

## Installation

Install [Hammerspoon](https://www.hammerspoon.org/) first, then:

```bash
$ cd ~/.hammerspoon/Spoons
$ git clone https://github.com/luizclaudiomoreira/MyWindowManager.spoon.git
```

In your `~/.hammerspoon/init.lua`, add the following:

```lua
hs.loadSpoon("MyWindowManager")
spoon.MyWindowManager:init()
```

You can customize the key bindings by modifying the `init()` function in `MyWindowManager.spoon/init.lua`.

## Usage

By default, the following key bindings are available:

| Key Combination | Action             |
|-----------------|--------------------|
| ⌘⌥0              | Maximize window     |
| ⌘⌥9              | Resize to 1920x1080 |
| ⌘⌥8              | Resize to 1710x962  |
| ⌘⌥7              | Resize to 1600x900  |
| ⌘⌥6              | Resize to 1470x827  |

Note: The `Maximize` function respects a 15 pixel margin.

## License

[MIT](LICENSE)