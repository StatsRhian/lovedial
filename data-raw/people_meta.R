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
      "Sarah", "lesiure",   5599L,    "basketball",         NA,   "scarf",  "wearing",
        "Ben", "lesiure",   4884L,    "basketball",         NA, "glasses",  "wearing",
      "Chloe", "lesiure",   6668L,        "tennis",         NA,     "hat",  "wearing",
   "Mohammed", "lesiure",   7557L,        "tennis",         NA, "glasses",  "wearing"
  )

people_meta <-
  people_meta |>
  dplyr::mutate(number = paste0("555-", number))

usethis::use_data(people_meta, internal = TRUE, overwrite = TRUE)

