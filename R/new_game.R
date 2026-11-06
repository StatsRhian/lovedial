#' New game
#' Creates a new game with admirer and clue set
#' @export
new_game <- function(){
  set.seed(5555)
  people <- make_people()
  people[[sample(24,1)]]@admirer <- TRUE
  people <- generate_clues(people)
  board <- initialise_board()
  print(board$summary)

  cli::cli_h1("\U260E  Lovedial")
  cli::cli_alert_info(
    "Call someone with `dial(Name)`"
  )
  # Create individual objects in the calling environment
  list2env(people, envir = parent.frame())

  invisible(NULL)
}

generate_clues <- function(people){
  clues <- people_meta |> dplyr::select(.data$name, .data$gives)
  admirer <- purrr::detect(
    people,
    \(person) S7::prop(person, "admirer")
  )

  clues <-
    clues |>
    dplyr::group_by(gives) |>
    dplyr::mutate(
      value = sample(get_valid_clue(admirer, dplyr::first(gives)))
    ) |>
    dplyr::ungroup()

  # Assign game properties to people
  people <- purrr::map2(
    people,
    names(people),
    \(person, name) {
      S7::prop(person, "clue") <- clues$value[match(name, clues$name)]
      person
    }
  )
  return(people)
}

get_valid_clue <- function(admirer, clue_type) {
  all_choices <- unique(people_meta[[clue_type]])
  all_choices <- all_choices[!is.na(all_choices)]

  admirer_clue <- S7::prop(admirer, clue_type)

  if (admirer_clue %in% all_choices) {
    all_choices <- setdiff(all_choices, admirer_clue)
    all_choices <- c(all_choices, "dud")
  }
  all_choices
}

