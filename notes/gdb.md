# GDB Notes

Notes from the book, Debugging with GDB.

## GDB Commands

* run `make` from inside GDB with `make [make-args]`
* execute shell commands from inside GDB with `shell [cmd]`

* you can use `next [num]` or `step [num]` to perform that action
  more than one time.

* use `help [supposed command abbreviation]` to see if a
  command's abbreviation works.

* use TABTAB for autocomplete and suggestions from GDB
* `starti` will set a breakpoint at the first line of the
  program's main(), and then run the program.

You can use shell-like directory commands to set and change the
current working directory:

* `set cwd [directory]`
* `show cwd`
* `cd [directory]`
* `pwd`

### Examining Data

List breakpoints: `info breakpoints` -> `i b`

Disable breakpoint: `disable [bnum]` or `dis [bnum]`

Delete breakpoint: `d [breakpoint number]`

Display expression every time gdb stops at a breakpoint:

`display [expr]`

Display address location (useful for asm programs):

`display/<type><unit> [addr]`

For example, a quad-word data declaration (variable):

`display/dg &qVar1`

To print the contents of a register:

```asm
p/<data type> $[regname]

p/d $rax
p/x $al
```

# TUI

## Change window sizes

Use `winheight [name] [+/-]count` to change window sizes.
Ex: `winheight src +20`, `winheight reg -10`

Use `focus [name]` to bring focus to that window.
Ex: `focus next | prev | src | asm | regs | split`

### kill

* use `kill [pid]` to kill a running program

The kill command is also useful if you wish to recompile and relink your program,
since on many systems it is impossible to modify an executable file while it is running in a
process. In this case, when you next type run, gdb notices that the file has changed, and
reads the symbol table again (while trying to preserve your current breakpoint settings).

### Inferiors

* use `info inferiors` to get info about program(s) (yes!) being
  debugged by GDB. switch between them with `inferior [infno]`

* use `[add|clone]-inferior` to add inferiors to a running
  session.

### Threads & Forks

Refer back to p. 53 when you learn more about threads and forks,
but GDB can handle thread and switching, debugging, etc.

### Checkpoints

Checkpoints can be use to save a snapshot of a program's current
state(!!!!!). You can continue executing the program and return
to the checkpoint at a later time, undoing all changes since that
point.

* use `checkpoint` to create a checkpoint/saved state
* `info checkpoints` to list all current checkpoints
* `restart [checkpoint-id]` to go back to a saved checkpoint
* `delete checkpoint [checkpoint-id]` to delete a checkpoint

Note! The PID of the program being debugged will change every
every restoration to a checkpoint.

# Breakpoints, Watchpoints, Catchpoints

Use `tbreak [arg]` to set a breakpoint that only stops once.

Use `hbreak [arg]` to set a hardwarre assisted breakpoint. Useful
for debugging EPROM/ROM code.

Use `rbreak [regex]` to set breakpoints at all functions matching
the regex

`info break(points)` will print out a table of all known
breakpoints

Use `ignore` to ignore the first X times a breakpoint is hit.

Other forms of `watch` include `rwatch` and `awatch`. `rwatch`
will break when the variable is read from, `awatch` will break
when the variable is read or written.

`info watchpoints` will print a table similar to breakpoints.

You can force gdb to use only software watchpoints with the set can-use-hw-
watchpoints 0 command.

## Catchpoints

Catchpoints are used for stopping the program on certain types of
events. E.g. exceptions, system calls, forks, signals, etc.

## Modifying *points

`clear` will delete breakpoints at the next instruction to be
executed in the current stack frame.

`delete [breakpoints]` deletes the breakpoints. abbr. `d`

`info break` to list all types of known *points.

`disable` and `enable` have many options and arg lists, see p. 74
for details.

`commands [...list] ...commands... end` will specify a list of
commands to be executed when the breakpoint is hit. [p.77]

Save *points to a file from an active GDB session with `save
breakpoints [file]`. The *points can be loaded with the `source`
command.

## 5.2 Continuing and Stepping

"To resume execution at a different place, you can use return
(see Section 17.4 [Returning from a Function], page 272) to go
back to the calling function; or jump (see Section 17.2
[Continuing at a Different Address], page 270) to go to an
arbitrary location in your program."

  --> does `return` act like a step-out function? (sec. 17.4)
  --> does `jump` move to a different place in the code without
  modifying any variables? could this cause more issues at
  runtime? (sec. 17.2)

Use `stepi` to step through functions/code that doesn't have
  debugging information

Use `finish` (abbrev. `fin`) to continue executing until the end
of the current stack frame (this is probably more like step-out).
This is contrasted with the `return` command.

`until` (abbr. `u`) used inside of a loop will continue execution
until the loop ends, and then pause again immediately after (it
looks for jump statements in the code).

`until [locspec]` works just like without args, but will pause at
the locspec if it is reached first.

`advance` works like `until` but doesn't skip over recursive
function calls.

# 5.

## 5.3 Skipping over functions and files

`skip [options]` will skip over all functions when debugging. You
can skip over files, locations, functions, and anything that
matches a provided regular expression. (see p. 86 for options)

`skip -rfu ^std::(allocator|basic_string)<.*>::~?\1 *\(`

`skip -rfu ^std::([a-zA-z0-9_]+)<.*>::~?\1 *\(`

`info skip` will give you info about everything that's being
skipped.

## 5.4 Signals

Choose how GDB and your program react to received signals. For
example, if your program receives a SIGSEGV it would normally
terminate. However, with `handle SIGSEGV nopass` your program
would not stop after continuing from the received signal. You
could set the variables that contain erroneous values and then
continue as expected, or use `signal 0`. (p. 89) 

## 5.5 Starting and stopping multi-threaded applications

Come back when we learn more about threaded apps. Can set
scheduler locking mode, and selecct [all|non]-stop mode,
background execution, thread specific breakpoints, etc.

Observer mode seems interesting, but reread it later.

# 6. Running programs backward

`record` and `record btrace` are used to turn recording on and
off for reverse execution (going backward) in a program.

`reverse-continue` (abbr. `rc`) will undo executed code, stopping
at breakpoints and signals.

`reverse-finish`, `reverse-step[i]`, and `reverse-next[i]` are both self-explanatory

`set exec-direction [reverse|forward]` will set the direction of
execution for the regular `next[i]`, `step[i]` commands.
