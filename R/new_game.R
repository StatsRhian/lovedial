#' New game
#' Creates a new game with admirer and clue set
#' @export
new_game <- function(){
  set.seed(5555)
  boys <- make_boys()
  boys[[sample(24,1)]]@admirer <- TRUE
  boys <- generate_clues(boys)

  # Create individual objects in the calling environment
  list2env(boys, envir = parent.frame())

  invisible(NULL)
}

generate_clues <- function(boys){
  clues <- boys_meta |> dplyr::select(.data$name, .data$gives)
  admirer <- purrr::detect(
    boys,
    \(boy) S7::prop(boy, "admirer")
  )

  clues <-
    clues |>
    dplyr::group_by(gives) |>
    dplyr::mutate(
      value = sample(get_valid_clue(admirer, dplyr::first(gives)))
    ) |>
    dplyr::ungroup()

  # Assign game properties to boys objects
  boys <- purrr::map2(
    boys,
    names(boys),
    \(boy, name) {
      S7::prop(boy, "clue") <- clues$value[match(name, clues$name)]
      boy
    }
  )
  return(boys)
}

get_valid_clue <- function(admirer, clue_type) {
  all_choices <- unique(boys_meta[[clue_type]])
  all_choices <- all_choices[!is.na(all_choices)]

  admirer_clue <- S7::prop(admirer, clue_type)

  if (admirer_clue %in% all_choices) {
    all_choices <- setdiff(all_choices, admirer_clue)
    all_choices <- c(all_choices, "dud")
  }
  all_choices
}

