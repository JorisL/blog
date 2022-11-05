# blog
JorisL blog source repository.

Markdown pages in the /src directory are converted by Pandoc to html using [this](https://jez.io/pandoc-markdown-css-theme/) theme.

# Installation
Pandoc and Pandoc-sidenote should be installed in order to generate the html pages.
On OSX this can be installed using the following homebrew commands:

```
brew install pandoc coreutils
brew tap jez/formulae
brew install pandoc-sidenote
```

# Usage
run `make` (optionally first `make clean`) to (re-)create the /Public directory, which is the root folder of the served web pages.
