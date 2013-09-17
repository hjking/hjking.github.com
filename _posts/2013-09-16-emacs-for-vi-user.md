---
comments: true
date: 2013-09-16 12:29:00
layout: post
slug: emacs-for-vi-users
title: "Emacs for Vi Users"
summary: "This is intended as an introductory guide for vi users wishing to learn the
basics of Emacs."
image: 'why-its-important-to-know-how-to-use-your-tools/cover.png'
categories: emacs
tags: [emacs, vim]
---

# Emacs for vi users

  "Why can't I enter command mode?"


## Introduction

This is intended as an introductory guide for vi users wishing to learn the
basics of Emacs.  I'm writing it because I'm one of them, and I suspect that I'm
not alone in being mystified by the lack of a command mode, text objects and an
underlying `ex` editor, as well as the plethora of strange and unfamiliar key
combinations.  The intent is to give fledgling Emacs users a basic set of
commands, sufficient for basic editing.

This page is a basic Emacs survival guide for the vi user.  It is grounded in
familiarity of vi and (quite naturally) assumes a vi-centric view of the world.
Since the structure is that of a list of corresponding commands, I will not list
features that are unique to Emacs.  I believe there to be sufficient overlap
between the capabilities of each editor to motivate this approach.

This is not a joke.  It is not about religion or the
[Editor war](http://en.wikipedia.org/wiki/Editor_war) and I will not present one
editor as better than the other.  Neither is it about the Emacs mindset, since
I have yet to acquire it myself.  Finally, it is not a proper Emacs tutorial.
If you want to learn Emacs propely, go find a proper tutorial.  There is one
built into Emacs, for example.

Finally, it is not complete and I
[welcome contributions](mailto:public@elmindreda.org).


## Basics

Emacs doesn't have a separate command mode.  In a sense, you're always in
insert mode.  Therefore, special modifier keys are needed to tell commands
apart from typed characters.  The two commonly used modifiers are
*Control* and *Meta*.  On many systems, the Alt key can be used as
Meta.  If your system lacks a functional Meta key, you can type Escape before
the specified key.

Since Control and Meta are so frequently used in Emacs, they have created a
special convention for writing such commands, so for example **C-a**
corresponds to *Control+A*, and **M-f** corresponds to *Meta+F*.
The Emacs command column will use this convention.  This is also consistent
with the documentation in Emacs.

Many Emacs commands take numerical prefixes, but you need to hold down Meta
while typing them.  So, for example, type M-2 M-3 M-g g instead of 23G to go to
line 23.


## Commands

### Program operations

| Action                               | vi                  | Emacs           | Notes on Emacs                                          |
| ------------------------------------ | ------------------- | --------------- | ------------------------------------------------------- |
| Exit program                         | :q *Enter*          | C-x C-c         | If changes exist, will ask whether or not to save them. |
| Unconditionally exit program         | :q! *Enter*         | C-x C-c         | Just say no.                                            |
| Save current buffer and exit program | :wq *Enter*         | C-x C-s C-x C-c |                                                         |
| Cancel command                       | *Ctrl+c*            | C-g             |                                                         |
| Redraw screen                        | *Ctrl+l*            | C-l             |                                                         |
| Command line                         | :                   | M-x             |                                                         |


### File operations

| Action                             | vi                  | Emacs              | Notes on Emacs                        |
| ---------------------------------- | ------------------- | ------------------ | ------------------------------------- |
| Open file, or create named buffer  | :e *filename Enter* | C-x C-f *filename* |                                       |
| Save current buffer                | :w *Enter*          | C-x C-s            | Will not save a new, unmodified file. |
| Save current buffer under new name | :w *filename Enter* | C-x C-w *filename* |                                       |
| Move to next buffer                | :n *Enter*          | C-x b *buffer*     |                                       |
| Move to previous buffer            | :prev *Enter*       | C-x b *Enter*      |                                       |


### Navigation

| Action                             | vi       | Emacs           | Notes on Emacs                                     |
| ---------------------------------- | -------- | --------------- | -------------------------------------------------- |
| Go to beginning of buffer          | 1G       | M-<             |                                                    |
| Go to end of buffer                | G        | M->             |                                                    |
| Go left one character              | h        | C-b             | Will wrap to previous line.                        |
| Go right one character             | l        | C-f             | Will wrap to next line.                            |
| Go up one line                     | k        | C-p             |                                                    |
| Go down one line                   | j        | C-n             |                                                    |
| Go to line *n*                     | *n*G     | M-g g *n* Enter |                                                    |
| Go to beginning of line            | 0        | C-a             |                                                    |
| Go to end of line                  | $        | C-e             | Places cursor one step beyond last character.      |
| Go to next word                    | w        | M-f             | Stops at first non-word character before the word. |
| Go to previous word                | b        | M-b             |                                                    |
| Go to next page                    | *Ctrl+f* | C-v             |                                                    |
| Go to previous page                | *Ctrl+b* | M-v             |                                                    |
| Set mark *x*                       | m*x*     | C-x r Space *x* |                                                    |
| Go to mark *x*                     | '*x*     | C-x r j *x*     |                                                    |
| Go to first displayed line         | H        |                 |                                                    |
| Go to last displayed line          | L        |                 |                                                    |
| Move buffer one line up            | *Ctrl+y* | C-1 M-v         |                                                    |
| Move buffer one line down          | *Ctrl+e* | C-1 C-v         |                                                    |


### Text editing

| Action                             | vi  | Emacs       | Notes on Emacs                                     |
| ---------------------------------- | --- | ----------- | -------------------------------------------------- |
| Insert text                        | i   |             | Always in insert mode.                             |
| Append text                        | a   | C-f         | Only cursor movement is needed.                    |
| Insert at beginning of line        | I   | C-a         | Only cursor movement is needed.                    |
| Append to end of line              | A   | C-e         | Only cursor movement is needed.                    |
| Delete character forwards          | x   | C-d         |                                                    |
| Delete character backwards         | X   | Backspace   |                                                    |
| Change to end of line              | C   | C-k         | Only deletion is needed.                           |
| Delete to end of line              | D   | C-k         | Removes line entirely if empty.                    |
| Delete entire line                 | dd  | C-a C-k     | For empty lines.                                   |
|                                    |     | C-a C-k C-k | For non-empty lines.                               |
| Delete word forwards               | dw  | M-d         | Does not delete whitespace before next word.       |
| Delete word backwards              | db  | M-Backspace |                                                    |
| Open line above                    | O   | C-o         |                                                    |
| Open line below                    | o   | C-e Enter   |                                                    |
| Join lines                         | J   | C-n M-^     |                                                    |
| Undo last edit                     | u   | C-x u       |                                                    |


### Yanking and placing

| Action                             | vi    | Emacs       | Notes on Emacs                         |
| ---------------------------------- | ----- | ----------- | -------------------------------------- |
| Yank line                          | yy    | C-a C-k     | For empty lines.                       |
|                                    |       | C-a C-k C-k | For non-empty lines.                   |
| Yank *n* lines                     | *n*yy | C-Space *(move to line below last desired)* M-w |    |
| Cut *n* lines down                 | *n*dd | M-*n* C-k   |                                        |
| Paste before cursor                | P     | C-y         |                                        |
| Paste after cursor                 | p     |             |                                        |


### Searching and substitution

| Action              | vi                              | Emacs                              | Notes on Emacs |
| ------------------- | ----------------                | ---------------------------------- | -------------- |
| Search forwards     | /*pattern Enter*                | C-s *pattern* Enter                |                |
| Search backwards    | ?*pattern Enter*                | C-r *pattern* Enter                |                |
| Global replace text | :%s/*pattern*/*with*/gc *Enter* | M-% *word* Enter *with* Enter      |                |
|                     |                                 | C-M-% *pattern* Enter *with* Enter |                |


### Window operations

| Action                        | Vim         | Emacs | Notes on Emacs |
| -------------------           | ----------- | ----- | -------------- |
| Split horizontally            | *Ctrl+w s*  | C-x 2 |                |
| Split vertically              | *Ctrl+w v*  | C-x 3 |                |
| Close current window          | *Ctrl+w c*  | C-x 0 |                |
| Close all but current windows | *Ctrl+w o*  | C-x 1 |                |


## Credits

This page was partly inspired by
[Emacs for Vi Programmers](http://grok2.tripod.com/).

Thanks to Kaj, magda, Ian D, LeViMS, C. Warrington, E. Bowler and R. Pereira
for Emacs commands.

