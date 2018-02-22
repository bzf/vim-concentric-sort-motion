concentric-sort-motion.vim
==========================

Adds a motion for sorting CSS attributes using the [concentric style guide][1].

## Installation

Using [vim-plug][2]:

```vim
Plug 'bzf/vim-concentric-sort-motion'
```

then run `:PlugInstall` from inside `vim`.

_NOTE: This plugin requires that vim has been compiled with the +ruby feature
enabled. For neovim it requires the Ruby gem `neovim` to be installed._

## Usage

This plugin adds the motion to `gk` in normal mode.

Examples:

- `gkj` => Sorts the current line and the one below it concentricly.
- `gkip` => Sorts the current paragraph concentricly.
- `gkii` => Sorts the current indentation level concentricly (requires [text-obj-indent plugin][])

[text-obj-indent plugin]: https://github.com/kana/vim-textobj-indent

## Testing

The tests are written using RSpec. First install the dependencies for running
the tests:

```sh
bundle install
```

To run the tests execute:

```sh
bundle exec rspec
```

[1]: http://rhodesmill.org/brandon/2011/concentric-css/
[2]: https://github.com/junegunn/vim-plug
