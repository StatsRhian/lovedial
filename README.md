
# Love dial

<!-- badges: start -->
[![Lifecycle:Experimental](https://img.shields.io/badge/Lifecycle-Experimental-339999)](<Redirect-URL>)
<!-- badges: end -->

Guess who likes you in this secret admirer phone game.

## Installation
Tun the following R command to install {lovedial}:

```{r}
# install.packages("pak") # if not already installed
pak::pak("statsrhian/lovedial")
```
## Play

```{r}
library("lovedial")
new_game()
```

```
── ☎  Lovedial ─────────────────────────────────────────────────────────────
📞 Dial: `dial(Name)`
❌ Eliminate: `eliminate(Name)`
❓ Guess: `guess(Name)`
👀 View board: `view_board()`
```
