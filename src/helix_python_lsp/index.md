---
title: "Setting up the Helix editor and python-lsp-server for poetry projects"
subtitle: ""
author: "JorisL"
author-url: 'https://blog.jorisl.nl'
date: "November '22"
---

# Introduction

At work I've been developing several small-ish software projects in Python using
[poetry](https://python-poetry.org) to manage the different dependencies,
virtual environments, etc. for each of those projects. So far I've mostly been
using Visual Studio Code to edit these projects, instead of using my old and
trusted [Emacs config](https://github.com/JorisL/.emacs.d).

The main reason for using VS Code was due to difficulties with Emacs to get the
Python language server protocol correctly working for those projects. It _was_
quite easy to install and set-up the python-lsp-server with emacs for projects
using the main installed Python installation on my PC, but each of these
projects had their own python virtual environment with various packages either
not installed or with a different version of my "main" Python installation. This
caused problems with the LSP server, where it would state multiple errors in my
code due to it not being able to find the various packages and libraries used in
those projects. With VS Code this wasn't a problem, since it was relatively easy
to select either the main Python installation on my PC or the Python
installation within the poetry virtual environment.

In principle this setup worked for development, but I wasn't entirely happy
using it. The editor I mostly used outside of this project was Emacs, which I
already set up with a modal editing mode slightly based on
[Kakoune](https://kakoune.org). While there _are_ several extentions for VS code
to add a modal editing mode, they where never really a joy to use. Mostly due to
sluggishness and it still feeling like a "hack" on top of a non-modal editor,
instead of it beging an integraded experience. Furthermore several
functionalities I see as being essential to have in an editor, such as macros,
are not available in VS Code.

Lately I've been trying out the [Helix](https://helix-editor.com) editor, and so
far it has been a joy to use. It is a lightweight, modal, terminal text editor,
similar to VIM. But where with VIM you practically need to install mutliple
additional packages to make it sort-of usable for day-to-day use (LSP, FZF,
surround, etc.), Helix already has most of these functions build-in. And since
the editor is build with those integrations from the ground up it is quite a lot
easier and straightforward to use. And the default keybindings are, in my
opinion, a lot easier to remember and use as those from VIM. Most of the things
I also did with Emacs seem to be relatively easy to do with Helix (with some
small tweaks, such as using markdown for notes instead of org mode).

So, in order to try and transfer my workflow to Helix, I've been trying to set
it up with both
[python-lsp-server](https://github.com/python-lsp/python-lsp-server) and poetry,
and it seems I've found a workable solution for my use-case.

# How to configure the tools

## Poetry local .venv directory

Each poetry project always gets a seperate directory for storing it's Python
virtual environment. Thanks to this each project can have different versions of
Python and libraries installed without clashing with each other. By default a
directory is made in the `{cache-dir}/virtualenvs` of your PC, but poetry can
(and for this trick, should) also be set up to store the virtual-environment
data from a project within a .venv folder in the project root.

This is done by setting the `virtualenvs.in-project` within the
[poetry configuration](https://python-poetry.org/docs/configuration/#virtualenvsin-project)
to `true`.

## Activating the virtual enviroment

The .venv folder created within the project root contains scripts in order to
activate the virtual environment. See
[this](https://docs.python.org/3/library/venv.html#how-venvs-work) section in
the Python documentation. Within Windows this can be activated by first opening
a powershell terminal within the project root and then running
`.venv\Scripts\Activate.ps1`. Now, for as long as this terminal is open, the
paths to Python and other related binaries and scripts are changed to those kept
in the .venv directory. Note that this only counts when running commands within
that powershell session. Opening a new powershell terminal parallel to this one,
then running Python from that one will use the standard system Python binary.

## Installing python-lsp-server and other tools within the virtual environment

The trick to using LSP with Helix with a poetry project is to run Helix within
the powershell terminal after enabling the project's virtual environment. This
way, when the Helix process calls tools like `python-lsp-server` it will use the
Python installation as used in the poetry project. Therefore the LSP server also
correctly scans the project files with the python packages actually used in the
project.

But for this to work we now have to install `python-lsp-server` within the
project's virtual environment. The same counts for tools like `black`. Whilst in
the terminal with the virtual environment this can quickly be done using
`pip install python-lsp-server black`, but a better way would be to set up these
packages as requirements within the project's `pyproject.toml` file.

## Setting up Helix

Configure the `languages.toml` file withing the Helix configuration directory
(`./config/helix/` or `%AppData%\\Roaming\\helix`) to use `pylsp` as the
language server (and if wanted `black` to be the code formatter), and make sure
to **not** use hardcoded file paths for these. Otherwise when hardcoded paths
are used it will not use the .venv versions when needed.

An example of this is shown below[^1][^2]:

```{.toml .numberLines}
[[language]]
name = "python"
language-server = { command = "pylsp" }
formatter = { command = "black", args = ["--quiet", "-"] }
auto-format = true
```

[^1]: see <https://github.com/JorisL/helix> for my latest configuration,
including settings to set a max. line length for both formatting and linting.

[^2]: This is where we also must configure some LSP and formatter related
settings, for example max. line lengths, since these are not read from the
poetry's `pyproject.toml` configuration file. According to the Helix
documentation it should be possible to include a `languages.toml` settings file
like above within a project, such that you can have different settings LSP or
formatter settings for different projects, but I've not tested that yet.

## Testing the configuration

Helix has a startup option to check if the tools for a certain language are
correctly set up: `hx --health <language>`. When we open a new terminal window
and run this command with python as our language we should get something like
this:

```
$ hx --health python            
Configured language server: pylsp
Binary for language server: /opt/homebrew/bin/pylsp
Configured debug adapter: None
Highlight queries: ✓
Textobject queries: ✓
Indent queries: ✘
```

In this case the found language server binary is the one from our system Python
installation. But when this same command is executed from a terminal with the
virtual environment enabled we should see this path change to something like
`.venv/Scripts/pylsp`.

# Usage

Now, when we want to edit files from the given poetry project we need to start a
terminal in the root folder of the poetry project, and then enable the virtual
environment. If we then run `hx` within that terminal[^3] it will use the
project's pylsp server instead of the system's pylsp server.

[^3]: An added benefit of running hx within this terminal is that the working
directory of Helix is now the project's working directory. Now commands like
`<space> f` will only search for files within the project.

To make things a bit easier we can make a script or terminal configuration to
open a terminal in the project's directory and automatically enable the virtual
environment. Within, for example, Windows Terminal, this can be done by creating
a new powershell configuration with the project's root as startup path and the
followin line as startup command:

```
powershell -noexit .venv/Scripts/Activate.ps1
```

Now you can just start this configuration, run `hx`, and start editing. And a
2nd terminal with this configuration can be opened to run and debug the python
code.
