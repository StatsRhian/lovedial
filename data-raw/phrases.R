#' Game phrases and display labels
#'
#' A collection of phrases used throughout the game to generate character
#' dialogue, clues and responses. Also provides human-readable labels and
#' emoji representations for character attributes.
#'
#' The data is used to translate internal attribute values into text
#' displayed to the player.
#'
#' @format A tibble with 3 variables:
#' \describe{
#'   \item{key}{Internal identifier for the phrase or attribute.}
#'   \item{en}{English-language text associated with the key. This may be
#'   dialogue, a clue template or a human-readable attribute label.}
#'   \item{emoji}{Emoji representation of the attribute, where applicable.
#'   Missing values indicate that no emoji is associated with the phrase.}
#' }
#'
#' @details
#' The `key` column contains several types of entries:
#' \describe{
#'   \item{Dialogue}{General responses used during gameplay, such as
#'   `dud`, `rep`, `correct` and `wrong`.}
#'   \item{Clue templates}{Partial sentences used to introduce clues about
#'   clothing, locations, food and sports.}
#'   \item{Attributes}{Human-readable labels and emoji for character
#'   attributes, including clothing, food, sports and locations.}
#' }
#'
#' The `en` column contains the English-language version of each phrase.
#' The structure allows additional language columns to be added in future.
#'
#' @source Fictional game dialogue and labels created for this package.
#'
#' @seealso [people_meta] for the character attributes that use these phrases.
#' @keywords datasets
"phrases"

phrases <-
tibble::tribble(
                                                                          ~key,                                                             ~en,      ~emoji,
                                                                         "dud",                 "I know who it is, but I'm not telling, ha ha.",          NA,
                                                                         "rep",                                              "What? You again?",          NA,
                                                                     "correct",                              "You're right! I really like you.",          NA,
                                                                       "wrong",                               "Nice try... but it's not me!",          NA,
                                                                "clue_wearing",  "They looks cool in whatever they wear... They're not wearing",          NA,
                                                               "clue_location",       "Hello? I know where they hang out... They're not at the",          NA,
                                                                   "clue_food",                 "Hello? They'll eat almost anything, except...",          NA,
                                                                 "clue_sports",                      "Hello? They likes most sports... but not",          NA,
                                                                         "tie",                                                         "a tie", "\U1f454",
                                                                      "jacket",                                                      "a jacket", "\U1f9e5",
                                                                         "hat",                                                         "a hat", "\U1f9e2",
                                                                     "glasses",                                                       "glasses", "\U1f453",
                                                                       "jeans",                                                         "jeans", "\U1f456",
                                                                       "scarf",                                                       "a scarf", "\U1f9e3",
                                                                     "popcorn",                                                       "popcorn", "\U1f37f",
                                                                    "icecream",                                                     "ice cream", "\U1f366",
                                                                       "candy",                                                        "sweets", "\U1f36c",
                                                                       "pizza",                                                         "pizza", "\U1f355",
                                                                     "hotdogs",                                                      "hot dogs", "\U1F32D",
                                                                     "cookies",                                                       "cookies", "\U1f36a",
                                                                       "rugby",                                                         "rugby", "\U1F3C9",
                                                               "skateboarding",                                                 "skateboarding", "\U1f6f9",
                                                                  "volleyball",                                                    "volleyball", "\U1f3d0",
                                                                     "surfing",                                                       "surfing", "\U1f3c4",
                                                                  "basketball",                                                    "basketball", "\U1f3c0",
                                                                      "tennis",                                                        "tennis", "\U1f3be",
                                                                        "town",                                                 "Market Square", "\U1F306",
                                                                        "cafe",                                                    "Cuppa Cafe",  "\U2615",
                                                                      "cinema",                                              "Starlight Cinema", "\U1F3A6",
                                                                        "park",                                                   "Willow Park", "\U1f333",
                                                                       "beach",                                                     "Sandy Bay", "\U1F30A",
                                                                     "leisure",                                                 "Leisure World", "\U1F3CB"
                                                               )
usethis::use_data(phrases, internal = TRUE, overwrite = TRUE)
