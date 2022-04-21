# language and compiler
For a complete reference visit
[Glasgow Haskell Compiler Documentation](https://downloads.haskell.org/ghc/latest/docs/html/users_guide/index.html)  

+ glasgow haskell compiler
+ cabal - system for building and packaging haskell libraries and programs (https://www.haskell.org/cabal/)
+ stack - (https://docs.haskellstack.org/en/stable/README/)


install on windows
```cmd
choco install ghc cabal haskell-dev haskell-stack
refreshenv
```

```bash
sudo add-apt-repository -y ppa:hvr/ghc
sudo apt-get update
sudo apt-get install -y ghc cabal-install
curl -sSL https://get.haskellstack.org/ | sh
```

Call the program **ghc** to compile and link programs
```CMD
ghc <x>.hs
```

To start the ghc in interactive mode use **ghci**
```CMD
ghci
```
After you pressed enter you should see something similar to this:
```CMD
ghci> 
```
Now you can load haskell source files so files having the suffix *.hs* by typing:
```CMD
:load <x>.hs
```
for loading the content of the file *\<x\>.hs* in the current directory causing all definition and declarations inside *\<x\>.hs* to be usable from now on.  

For help type
```CMD
:?
```

---

## using cabal
```bash
mkdir myproject && cd myproject
cabal init
cabal run
```

## using stack
```bash
stack new my-project
cd my-project
stack setup
stack build
stack exec my-project-executable
```
---
---

# structure of teaching material
Read the beginning of the *functions.md* in the folder *functions* and look up unkown details about datatypes in the folder *datatypes*.  
Understand *functions of higher order*.  
Understand *type polymorphism* and *proof of program properties*.


---
# external resources:
+ https://www.haskell.org/ghc/download_ghc_9_0_2.html
+ https://www.haskell.org/tutorial/intro.html

