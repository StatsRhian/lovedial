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
#' @param ... Additional arguments passed to methods.
#' @export
dial <- S7::new_generic(
  "dial",
  dispatch_args = "person"
)

S7::method(dial, person) <- function(person) {
  give_clue(person)
}

#' Guess a person
#'
#' @param person A person object.
#' @param ... Additional arguments passed to methods.
#' @export
guess <- S7::new_generic(
  "guess",
  dispatch_args = "person"
)

S7::method(guess, person) <- function(person) {
  guess_response(person)
}

#' Eliminate a person
#'
#' @param person A person object.
#' @param ... Additional arguments passed to methods.
#' @export
eliminate <- S7::new_generic(
  "eliminate",
  dispatch_args = "person"
)

S7::method(eliminate, person) <- function(person) {
  .game$board <- .game$board |>
    dplyr::filter(name != person@name)
}
