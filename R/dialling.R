guess_response <- function(person) {
  dial_cli(person = person, is_guess = TRUE)
  if (person@admirer) {
    response <- glue::glue("{speak('correct')}")
    beepr::beep(
      system.file("assets", "audio", "guess_win.wav",
                  package = "lovedial")
    )
  } else {
    response <- glue::glue("{speak('wrong')}")
  }
  cli::cli_text("\U1F4AC {response}")
}

speak <- function(key, lang = "en") {
  phrases[[lang]][match(key, phrases$key)]
}

dial_cli <- function(person, is_guess = FALSE) {
  cli::cli_h1("\U260E  Lovedial")
  dial_number(person = person, is_guess = is_guess)
  .game$calls <- .game$calls + 1
}

give_clue <- function(person) {
  dial_cli(person = person)

  response <- if (person@clue == "dud") {
    speak("dud")
  } else {
    clue_type = paste0("clue_", person@gives)
    glue::glue("{speak(clue_type)} {speak(person@clue)}")
  }
  cli::cli_text("\U1F4AC {response}")
}

dial_number <- function(person, is_guess = FALSE) {
  if (!is.logical(is_guess)) {
    cli::cli_abort("{.var is_guess} must be TRUE or FALSE")
  }

  digits <- strsplit(person@number, "")[[1]][-4]

  withr::with_options(
    new = list(cli.spinner = "speaker"),
    code = {
      # Pick up handset
      cli::cli_progress_bar(
        name = paste("Dialling", person@name),
        status = "...",
        type = "tasks",
        format = "{cli::pb_spin} {cli::pb_name}: {cli::pb_status}",
        clear = FALSE
      )
      beepr::beep(
        system.file("assets", "audio", "phone_sounds", "tone_dial.wav",
                    package = "lovedial")
      )
      dialled <- ""

      # If making a guess, start with the hash key
      if (is_guess) {
        dialled <- "#"
        cli::cli_progress_update(status = dialled)
        beepr::beep(
          system.file("assets", "audio", "phone_sounds", "key_hash-guess.wav",
                      package = "lovedial")
        )
      }

      # Start dialling numbers
      for (digit in digits) {
        if (nchar(dialled) == (3L + is_guess)) {
          dialled <- paste0(dialled, "-")
        }
        dialled <- paste0(dialled, digit)
        cli::cli_progress_update(status = dialled)
        beepr::beep(
          system.file(
            "assets", "audio", "phone_sounds", sprintf("key_%s.wav", digit),
            package = "lovedial"
          )
        )
      }

      # wait for answer
      rings <- sample(1:3, 1)
      for (ring in seq_len(rings)) {
        for (dots in c(". ", "..")) {
          cli::cli_progress_update(
            status = paste0(dialled, " [Ringing", dots, " ]")
          )
          beepr::beep(
            system.file(
              "assets", "audio", "phone_sounds", "tone_ringback.wav",
              package = "lovedial"
            )
          )
        }
        cli::cli_progress_update(status = paste(dialled, "[Ringing...]"))
        Sys.sleep(0.9)
      }
      cli::cli_progress_update(status = dialled)
      cli::cli_progress_done()
    }
  )
  invisible(person)
}
