# If you come from bash you might have to change your $PATH
SYSTEM_PASS=$PATH
unset PATH

PATH=$HOME/bin
PATH=$PATH:/usr/local/bin
PATH=$PATH:/bin
PATH=$PATH:/usr/bin
PATH=$PATH:/usr/sbin
PATH=$PATH:/sbin
PATH=$PATH:$HOME/.local/bin

MYSCRIPTS=$HOME/scripts
CHARLES=/Applications/Charles.app/Contents/MacOS
HANA_SETUP=/Applications/sap/hdbclient:/usr/local/Cellar/maven/3.6.0/bin:$HOME/sapjvm_8/bin
P4MERGE=/Applications/p4merge.app/Contents/MacOS
DATASCIENCE=$HOME/opt/anaconda3/bin:$HOME/opt/anaconda3/condabin:/anaconda3/bin:
PYTHONS=/Library/Frameworks/Python.framework/Versions/3.7/bin:$HOME/Library/Python/2.7/bin
OPAMS=$HOME/.opam/default/bin
XMAKE=$HOME/xmake-0.9.3-33/bin
CLANGD=/usr/local/opt/llvm/bin
YARN=$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin
NODE=/usr/local/opt/node@12/bin
RUST=$HOME/.cargo/bin
LUA=$HOME/.config/lua-5.4.2/src

PATH=$PATH:$MYSCRIPTS:$CHARLES:$HANA_SETUP:$P4MERGE:$DATASCIENCE:$PYTHONS:$OPAMS:$XMAKE:$CLANGD:$YARN:$NODE:$RUST:$LUA
export PATH

export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"
export VISUAL=nvim
export EDITOR=$VISUAL
