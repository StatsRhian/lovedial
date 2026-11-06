#' People and their attributes
#'
#' Metadata describing the fictional characters in the game, including their
#' telephone numbers and personal attributes. Each character has a location,
#' either a favourite sport or favourite food and clothing item.
#'
#' The data is used to generate character objects and clues during gameplay.
#'
#' @format A tibble with 24 rows and 7 variables:
#' \describe{
#'   \item{name}{Character's first name.}
#'   \item{location}{Favourite place to hang out.}
#'   \item{number}{Character's telephone number.}
#'   \item{sports}{Favourite sport.}
#'   \item{food}{Favourite food.}
#'   \item{wearing}{Item of clothing or accessory worn by the character.}
#'   \item{gives}{Attribute that the character provides as a clue about
#'   another character.}
#' }
#'
#' @details
#' Each character has one value for each attribute, although `sports` and
#' `food` are mutually exclusive in the dataset. The `gives` variable
#' determines which attribute is revealed when contacting a character.
#'
#' This fictional dataset was created for the game and is loosely inspired
#' by the 1990s Dream Phone board game.
#'
#' @source Fictional data created for this package.
#'
#' @seealso [new_game()] for creating a new game.
#' @keywords datasets
"people_meta"
people_meta <- tibble::tribble(
        ~name, ~location, ~number,         ~sports,      ~food,  ~wearing,     ~gives,
      "Daisy",    "town",   1111L,              NA,  "cookies",   "jeans", "location",
    "Gabriel",    "town",   1233L,              NA, "icecream",     "tie", "location",
     "Daniel",    "town",   4566L,              NA, "icecream",  "jacket", "location",
      "Alice",    "town",   7899L,              NA,  "cookies",     "tie", "location",
       "Jude",    "cafe",   2588L,              NA,  "hotdogs",  "jacket", "location",
      "Poppy",    "cafe",   3333L,              NA,    "pizza", "glasses", "location",
      "Bella",    "cafe",   3699L,              NA,    "pizza",     "tie",   "sports",
       "Theo",    "cafe",   1477L,              NA,  "hotdogs",   "jeans",   "sports",
    "Jessica",  "cinema",   9877L,              NA,    "candy",     "tie",   "sports",
      "Gemma",  "cinema",   3211L,              NA,  "popcorn",   "jeans",   "sports",
      "Dylan",  "cinema",   7777L,              NA,    "candy",   "jeans",   "sports",
  "Sebastian",  "cinema",   6544L,              NA,  "popcorn",  "jacket",   "sports",
      "Megan",    "park",   8522L,         "rugby",         NA,     "hat",     "food",
     "Joseph",    "park",   7411L,         "rugby",         NA, "glasses",     "food",
     "Sophie",    "park",   9999L, "skateboarding",         NA,  "jacket",     "food",
     "Joshua",    "park",   9633L, "skateboarding",         NA,   "scarf",     "food",
    "Patrick",   "beach",   5515L,    "volleyball",         NA,   "scarf",     "food",
       "Toby",   "beach",   2442L,    "volleyball",         NA,     "hat",     "food",
     "Willow",   "beach",   3535L,       "surfing",         NA,   "scarf",  "wearing",
        "Mia",   "beach",   2226L,       "surfing",         NA,     "hat",  "wearing",
      "Sarah", "leisure",   5599L,    "basketball",         NA,   "scarf",  "wearing",
        "Ben", "leisure",   4884L,    "basketball",         NA, "glasses",  "wearing",
      "Chloe", "leisure",   6668L,        "tennis",         NA,     "hat",  "wearing",
   "Mohammed", "leisure",   7557L,        "tennis",         NA, "glasses",  "wearing"
  )

people_meta <-
  people_meta |>
  dplyr::mutate(number = paste0("555-", number))

usethis::use_data(people_meta, internal = TRUE, overwrite = TRUE)

