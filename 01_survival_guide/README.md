# A physicist survival guide to computing

This week we do not have particular tasks at hand, so we will cover the introduction to basis tasks that are in general important to survive this course and a computational physicist life.

## Code editor: VSCODE

- You can [download](https://code.visualstudio.com/download) VScode online. It works for any platform (MacOS, Ubuntu, Windows);
- Create an account to share the same settings along your devices;
- You can find the [basic commands online](https://code.visualstudio.com/docs/introvideos/basics);
- Customize your experience with extensions. I suggest the followings:
  - Modern fortran
  - Python
  - Markdown preview
  - Remote - ssh
  - Latex workshop
  - GitLens

- Use AI assistants with care:
  - Fortran Intellisense
  - Intellicode
  - autoDocstring
  - Copilot
  - ....

You can also open Linux/Ubuntu terminals from VSCode, to run your jobs from there. For Windows:

 - execute `wsl --install` in Powershell
 - Test it: open Ubuntu from the Start menu
 - In VS Code open a new remote connextion "Remote-WSL: New Window"

## The terminal

The terminal is the basic tool to handle computations on your PC/on a cluster. Every time the `<...>` syntax is used it means you should fill it up with something. Here are some basic commands:

- `mkdir <dir_name>` creates a folder;
- `vim <file_name>` opens a file. If the file does not exist already, creates a new file;
- `cd <PATH>` let you move across folders;
- `echo <sentence>` lets you print a sentence on the terminal;
- `ls <PATH>` prints on terminal the content of the folder reached by the path;
- `cat <filename>` prints on terminal the content of a file;
- `rm <file_name>` deletes the file;
- `rm -r <dir_name>` deletes the directory;
- `cp <original_PATH> <destination_PATH>` copies a file from a PATH to another;
- `mv <original_PATH> <destination_PATH>` moves a file from a PATH to another. It is also used for renaming files;
- `export <VARIABLE_NAME>=<value>` sets the value of an environmental variable, that can be later accessed through the terminal. To access those variables in terminal use the syntax `${<VARIABLE_NAME>}`;
- `ssh <username>@<address>` lets you log in with ssh to a given remote machine. You can later on configure VSCode to do this for you with the remote extension.

You can always use `<command> -h` or `man <command>` to have additional informations on the command or on its optional arguments.

<details>
  <summary>Exercise 1</summary>
  Create a `hello_world.sh` file. The file can be run by typing in the terminal `source hello_world.sh`
  Open the file, and write a bash program that:

    - Creates a folder;
    - Moves into that folder;
    - Sets as the `MYPATH` environment variable the current directory name;
    - Prints the environmental variable on terminal;
    - Prints the content of the folder on terminal;
    - Goes back to the previous folder;
    - Prints the file `error.txt` on terminal;
    - Remove the folder you created.
</details>

## Creating a key pair

Key pairs are used to authenticate and securely communicate with trusted services without requiring a password. They can be created and used in different contexts. A key is associated with the device it is stored on, and it can be linked to one or (though less securely) multiple services.

These are the steps to create a key pair that will be used later. The steps are the same, though slightly different, in Windows/Linux/MacOs 

- `ssh-keygen -t ed25519 -C "key_identifier"` it creates the public/private key pairs 
- `Start-Service ssh-agent` Windows command
  `eval "$(ssh-agent -s)"` Ubuntu command
- `ssh-add $env:C:\Users\<user_name>\.ssh\name_of_the_key` Windows command
  `ssh-add ~/.ssh/id_ed25519` Ubuntu command

Now the key is ready to be used. Check which files have been created in the `.ssh` folder.

<details>
  <summary>Exercise 2</summary>
  Following the previous steps, create a key pair.
</details>

## Git, GitHub and GitLab

Coding in the scientific community can be tough. Multiple people working at the same time on the same codebase, implementing multiple features. For this (and many other) reason we need to implement a version control that enables us to work on the same codebase at the same time.
Git lets you do that, and GitHub/GitLab are online services to host your code. This repository is indeed on GitLab. Here are some important commands for handling git workflow:

- `git clone <repository>` makes a copy of the repository held online;
- `git fetch (<branch>)` updates the local Git repository (branch) with the latest version online; no changes will occurr in your local branch;
- `git pull` updates your local branch to the content of the remote branch;
- `git add <filename>` adds the file to the files ot be committed later. DO NOT USE `git add .` since it will add all the files. At most you can use `git add -u .`, that adds all the files that were already present;
- `git commit -m "<message>"` commits your changes adding them to the history;
- `git push` pushes the commits to the online repository;
- `git diff` prints at terminal the current differences with the last commit;
- `git checkout <branch_name>` changes branch;
- `git checkout -b <branch_name>` changes branch creating a new one;
- `git merge <this_branch> <that_branch>`, merges this branch to that branch. It is what it's used to implement new changes in a codebase when multiple peaple are working on that.

The merges to the principal branch of the project can be controlled through merge requests, where the main developers can have a look at your code to be sure nothing breaks the rest of the code.

<details>
  <summary>Exercise 2</summary>

    - Add the public key you created in the previous exercise to your github account
    - Clone this repository (if you didn't do it already)
    - Create your branch named `student/<your_surname>`
    - Add, commit and push `hello_world.sh`
</details>

## Compiling

In the next two assignment you will have to compile programs. Compiled languages are usually faster than interpreted ones, since they are explicitely written "for the machine". Compiled languages are, for example, C++ and Fortran. In these languages all the variables should be declared stating their type. We will focus on the latter. Compiling a single file is relatively easy, while compiling multiple files can be challanging and require [dark magic](https://makefiletutorial.com/).
If you are interested in learning more there is also a difference in compiling (writing the program for the machine) and linking (merging together all the files you use for your program).

For compiling a single file we will use either `gfortran` or `ifort`, respectively the gnu and intel compiler. To compile use the following syntax:

```bash
<compiler> <file_to_compile.f90> -o <output_file_name>
```

<details>
  <summary>Exercise 3</summary>

    - Try to compile the file `test.f90`;
    - Fix the compiling error in the program;
    - Run the result.

</details>

## [The answer to most of your problems](https://stackoverflow.com/)

You will not remember everything. This document will help you with this easy stuff. This title will save your life.
