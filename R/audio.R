#' Play one of the audio assets
#' 
#' @param sound The filename that should be played (without the .wav extension)
#' @param group The category the sound belongs to. This determines which sub-folder
#'   of the inst/assets/audio directory to look in.
play_audio <- function(sound, group = c("clue", "guess", "phone")) {
  group <- match.arg(group)
  
  audio_file <- system.file(
    "assets",
    "audio",
    group,
    paste0(sound, ".wav"),
    package = "lovedial"
  )

  if (file.exists(audio_file)) {
    beepr::beep(audio_file)
  } else {
    cli::cli_warn(
      "Can't find audio file at [inst/]assets/audio/{group}/{sound}.wav!"
    )
  }
}
