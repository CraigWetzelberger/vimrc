Install:

```
brew install python@3.14 lua gettext perl ruby   # deps (many already installed)

git clone https://github.com/vim/vim.git
cd vim

./configure \
  --with-features=huge \
  --enable-multibyte \
  --enable-terminal \
  --enable-cscope \
  --enable-luainterp=dynamic \
  --enable-perlinterp=dynamic \
  --enable-rubyinterp=dynamic \
  --enable-python3interp=dynamic \
  --with-python3-config-dir="$(/opt/homebrew/opt/python@3.14/bin/python3.14-config --configdir)" \
  --prefix="$HOME/.local"

make -j$(sysctl -n hw.ncpu) && make install
export PATH="$HOME/.local/bin:$PATH"
vim --version | grep -E 'python3'
```


# Clean tree:

```
make distclean 2>/dev/null || true
rm -f auto/config.cache``
```
