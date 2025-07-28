---
title: "Writing a simple lisp in LabVIEW and Nim"
date: 2023-01-15
tags: ["programming", "lisp", "LabVIEW", "Nim"]
description: "Making my own programming language, first in LabVIEW and then in Nim."
---
# Writing a simple lisp in LabVIEW and Nim

Learning how to make an interpreter for a custom programming language was a challenge I wanted to do for quite some time.
Due to it's simplicity in parsing, and the number of resources available, it was a simple choice to make the custom language a lisp-like language.

## LabVIEW

[The first version](https://github.com/JorisL/labview_lisp) of my custom interpreter was made in LabVIEW, for the following reasons:

- LabVIEW is often used at my job, but it had been a while since I programmed in it myself.
  So I wanted to fresh up my knowledge.
- There are lots of resources online, which I definitely needed to use, showing how to implement a lisp in a common language (Python, C, etc.).
  Trying to implement it myself in LabVIEW, which uses a different paradigm than almost all other languages [^1], forces me to actually understand what the examples show.
- LabVIEW is arguably one of the worst (e.g. fun) languages suited for this kind of task.
  And there are examples of people implementing a lisp in [many languages](https://github.com/kanaka/mal), I didn't yet see anyone who implemented something like this in LabVIEW.

In this version of my programming language, I was eventually able to do things as defining functions and applying those functions to data.

```lisp
(do
 ; get first element from a list
 (define first
   (lambda (x)
     (nth 0 x)))

 ; get remainder of list after first element
 (define rest
   (lambda (x)
     (nthrest 0 x)))

 ; insert element at the end of a list
 (define append
   (lambda (lst elt)
     (insert lst (len lst) elt)))

 ; apply return a list with func applied to each element of lst
 (define map
   (lambda (func lst)
     (do
       (define lstout (list))
       (while (not (= lst (list)))
         (do
           (define lstout (append lstout
                                  (func (first lst))))
           (define lst (rest lst))))
       lstout)))


  (map (lambda (x) (* x x))
      (list 1 2 3 4 5 6)))

; returns (1 4 9 16 25 36)

```

However, the implementation of this language needs a lot of recursion, and the number of recursive calls to VI's is severely limited.
Therefore the complexity of the program that can run are really limited.

## Nim

After implementing an initial version in LabVIEW, I wanted to make an interpreter that would actually be capable of running 'something'.
For [this implementation](https://github.com/JorisL/nim_lisp) I'd chosen [Nim](https://nim-lang.org), as it is a relatively high-level, but still quick and compiled, language.
This project was a good way of trying out the language.

In this version of the language I was able to add some additional functionalities, such as Macro support.
Using lisp macro's you are able to add features and structures to the language that can't be implemented as a function during execution.
See the snippet below from the 'standard library'; In the Nim interpreter I did not define how it should handle an `and` or `or` keyword,
and these cannot be implemented as functions[^2].
But using macro's it is possible to define how these can be rewritten as, in this case, an if statement (which in turn is also defined as a macro).

```lisp
 (define and
   (macro
    (a b)
    (quasiquote
     (if (unquote a) (unquote b) nil))))

 (define or
   (macro
    (a b)
    (quasiquote
     (if (unquote a) (unquote a) (unquote b)))))
```

In order to test that my programming language could actually do 'something', I [implemented another programming language in it](https://github.com/JorisL/nim_lisp/blob/main/examples/bf/brainfuck.nlisp).
Note that efficiency was not the main goal of this project :smile:[^3].

---

[^1]: LabVIEW uses the dataflow programming paradigm, while most languages are instead of procedural, functional, and/or object oriented.

[^2]: A function always evaluates it's arguments. For example `(+ 2 (* 6 7))` first evaluates to `(+ 2 42)`.
      But in, for example, an `and` statement, you only want the 2nd argument to be evaluated if the first argument is true.
      Therefore it is not possible to implement an `and` statement, among others, as a function.

[^3]: Eventually I ran a brainfuck interpreter in my brainfuck interpreter in my lisp, and used that to run a brainfuck hello world program.
      That one took around 24 hours to run.