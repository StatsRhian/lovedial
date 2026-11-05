responses <-
tibble::tribble(
             ~key,                                                 ~response,
            "dud",           "I know who it is, but I'm not telling, ha ha.",
            "rep",                                        "What? You again?",
        "correct",                        "You're right! I really like you.",
          "wrong",                        "Nice try... but it's not me!",
   "clue_wearing",  "He looks cool in whatever he wears... He's not wearing",
  "clue_location",     "Hello? I know where he hangs out... He's not at the",
      "clue_food",             "Hello? He'll eat almost anything, except...",
    "clue_sports",                  "Hello? He likes most sports... but not"
  )

usethis::use_data(responses, internal = TRUE, overwrite = TRUE)
