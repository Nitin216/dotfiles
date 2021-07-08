# If you come from bash you might have to change your $PATH
SYSTEM_PASS=$PATH
unset PATH

export ANDROID_HOME=$HOME/Library/Android/sdk

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
NODE=/usr/local/opt/node@12/bin
RUST=$HOME/.cargo/bin
LUA=$HOME/.config/lua-5.4.2/src
FLUTTER=$HOME/Desktop/Personal\ Work/Flutter/flutter/bin


PATH=$PATH:$MYSCRIPTS:$CHARLES:$HANA_SETUP:$P4MERGE:$DATASCIENCE:$PYTHONS:$OPAMS:$XMAKE:$CLANGD:$NODE:$RUST:$LUA:$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$FLUTTER

export PATH

export LDFLAGS="-L/usr/local/opt/llvm/lib"
export CPPFLAGS="-I/usr/local/opt/llvm/include"
export VISUAL=nvim
export EDITOR=$VISUAL
