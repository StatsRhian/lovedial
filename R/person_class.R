  person <- S7::new_class(
    "person",
    properties = list(
      name = S7::class_character,
      number = S7::class_character,
      location =S7::class_character,
      sports = S7::class_character,
      food = S7::class_character,
      wearing = S7::class_character,
      gives = S7::class_character,
      clue = S7::class_character,
      admirer = S7::new_property(
        S7::class_logical,
        default = FALSE
      )
    )
  )

  #' Creates a list of 24 people from the people_meta
make_people <- function(){
 people_objects <- purrr::pmap(
    people_meta,
    \(...) do.call(person, list(...))
  )  |>
    purrr::set_names(people_meta$name)
  people_objects
  }


#' Call a person
#'
#' @param person A person object.
#' @export
dial <- S7::new_generic(
  "dial",
  dispatch_args = "person"
)

S7::method(dial, person) <- function(person) {
  give_clue(person)
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


#' Guess a person
#'
#' @param person A person object.
#' @export
guess <- S7::new_generic(
  "guess",
  dispatch_args = "person"
)

S7::method(guess, person) <- function(person) {
  guess_response(person)
}

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
}
