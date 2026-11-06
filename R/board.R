initialise_board <- function(){
people_meta |>
  dplyr::mutate(summary = glue::glue("{name} {speak(location, 'emoji')}{speak(sports, 'emoji')} {speak(food, 'emoji')} {speak(wearing, 'emoji')}",   .na = "")) |>
  dplyr::select(name, summary)
}
