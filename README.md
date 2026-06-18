# Nix Environments
## Remote Shells
Enter a remote shell with default hooks:
 ``` 
 nix develop github:niridium/nix-shells/#<shell>
 ```
## Templates (WIP)
### **Templates currently require extra work to integrate them**

All shells come with a template, you will need an existing flake with [flake-parts](https://flake.parts/index.html) to use them. 

Copy the shell template:
```
nix flake init -t github:niridium/nix-shells/#templates.<shell>
```
Get the hooks template: 
```
nix flake init -t github:niridium/nix-shells/#templates.git-hooks
```
