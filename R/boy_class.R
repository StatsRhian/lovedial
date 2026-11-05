  boy <- S7::new_class(
    "boy",
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

  #' Creates a list of 24 boys from the boys_meta
  make_boys <- function(){
  boys_objects <- purrr::pmap(
    boys_meta,
    \(...) do.call(boy, list(...))
  )  |>
    purrr::set_names(boys_meta$name)
  boys_objects
  }


#' Call a boy
#'
#' @param boy A boy object.
#' @export
call_boy <- S7::new_generic(
  "call_boy",
  dispatch_args = "boy"
)

S7::method(call_boy, boy) <- function(boy) {
  give_clue(boy)
}


#' Guess a boy
#'
#' @param boy A boy object.
#' @export
guess_boy <- S7::new_generic(
  "guess_boy",
  dispatch_args = "boy"
)

S7::method(guess_boy, boy) <- function(boy) {
  guess_clue(boy)
}

give_clue <- function(boy) {

  ringing <- glue::glue(
    "Dialing {boy@name}... {boy@number}\n"
  )

  response <- if (boy@clue == "dud") {
    speak("dud")
  } else {
    paste0(speak(paste0("clue_",boy@gives)),
           boy@clue)
  }

  paste(ringing, response)
}

guess_boy <- function(boy){

  if(boy@admirer){
    speak("correct")}
  else{
    speak("wrong")
  }
  }


speak <- function(key){
  responses |>
    dplyr::filter(key == .env$key) |>
    dplyr::pull(response)
}

