
guess_response <- function(person){
  
  dial_cli(person)
  if(person@admirer){
    response <- glue::glue("\U1F4AC {speak('correct')}")
    }
  else{
    response <- glue::glue("\U1F4AC {speak('wrong')}")
  }
  cli::cli_text("\U1F4AC {response}")
  }

speak <- function(key, lang = "en"){
  phrases[[lang]][match(key, phrases$key)]
}

dial_cli <- function(person){
  cli::cli_h1("\U260E  Lovedial")
  cli::cli_alert_info(
    "Dialling {person@name}..."
  )
  Sys.sleep(1)
  .game$calls <- .game$calls + 1
}

give_clue <- function(person) {
  
  dial_cli(person)
  
  response <- if (person@clue == "dud") {
    speak("dud")
  } else {
    clue_type = paste0("clue_",person@gives)
    glue::glue("{speak(clue_type)} {speak(person@clue)}")
  }
  cli::cli_text("\U1F4AC {response}")
}