boys_meta <- tibble::tribble(
                      ~name,         ~location,  ~number,         ~sports,      ~food,     ~wearing,     ~gives,
                     "Dave",  "Crosstown Mall",   1111L,              NA,  "cookies",  "bluejeans", "location",
                   "George",  "Crosstown Mall",   1233L,              NA, "icecream",        "tie", "location",
                     "Dale",  "Crosstown Mall",   4566L,              NA, "icecream",     "jacket", "location",
                     "Alan",  "Crosstown Mall",   7899L,              NA,  "cookies",        "tie", "location",
                    "James",      "Snack Shop",   2588L,              NA,   "hotdog",     "jacket", "location",
                     "Phil",      "Snack Shop",   3333L,              NA,    "pizza",    "glasses", "location",
                    "Bruce",      "Snack Shop",   3699L,              NA,    "pizza",        "tie",   "sports",
                    "Tyler",      "Snack Shop",   1477L,              NA,   "hotdog",  "bluejeans",   "sports",
                    "Jamal",     "Reel Movies",   9877L,              NA,    "candy",        "tie",   "sports",
                     "Gary",     "Reel Movies",   3211L,              NA,  "popcorn",  "bluejeans",   "sports",
                      "Dan",     "Reel Movies",   7777L,              NA,    "candy",  "bluejeans",   "sports",
                  "Spencer",     "Reel Movies",   6544L,              NA,  "popcorn",     "jacket",   "sports",
                     "Mark",   "Woodland Park",   8522L,      "baseball",         NA,        "hat",     "food",
                    "Jason",   "Woodland Park",   7411L,      "baseball",         NA,    "glasses",     "food",
                    "Steve",   "Woodland Park",   9999L, "skateboarding",         NA,     "jacket",     "food",
                     "John",   "Woodland Park",   9633L, "skateboarding",         NA,     "yellow",     "food",
                     "Paul", "High Tide Beach",   5515L,    "volleyball",         NA,     "yellow",     "food",
                     "Tony", "High Tide Beach",   2442L,    "volleyball",         NA,        "hat",     "food",
                    "Wayne", "High Tide Beach",   3535L,       "surfing",         NA,     "yellow",  "wearing",
                     "Mike", "High Tide Beach",   2226L,       "surfing",         NA,        "hat",  "wearing",
                    "Scott",       "Jim's Gym",   5599L,    "basketball",         NA,     "yellow",  "wearing",
                      "Bob",       "Jim's Gym",   4884L,    "basketball",         NA,    "glasses",  "wearing",
                   "Carlos",       "Jim's Gym",   6668L,        "tennis",         NA,        "hat",  "wearing",
                     "Matt",       "Jim's Gym",   7557L,        "tennis",         NA,    "glasses",  "wearing"
                  )

boys_meta <-
  boys_meta |>
  dplyr::mutate(number = paste0("555-", number))

usethis::use_data(boys_meta, internal = TRUE, overwrite = TRUE)

