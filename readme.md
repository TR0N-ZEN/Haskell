# language and compiler
For a complete reference visit
[Glasgow Haskell Compiler Documentation](https://downloads.haskell.org/ghc/latest/docs/html/users_guide/index.html)  

Call the program **ghc** to compile and link programs
```CMD
ghc program.hs
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
:load file_1
```
for loading the content of the file *file_1.hs* in the current directory causing all definition ans declarations to be usable from now on.  

For help type
```CMD
:?
```

---

# structure of teaching material
Read the beginning of the *functions.md* in the folder *functions* and look up unkown details about datatypes in the folder *datatypes*.  
Understand *functions of higher order*.  
Understand *type polymorphism* and *proof of program properties*.


---
# external resources:
+ https://www.haskell.org/tutorial/intro.html
+ https://www.haskell.org/ghc/download_ghc_9_0_2.html