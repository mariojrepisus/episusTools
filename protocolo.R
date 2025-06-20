usethis::create_package("C:/Users/mario.junior/OneDrive/Documentos/r/episus_tools")

usethis::use_git_config(user.name = "Seu Nome", user.email = "seu.email@example.com")

devtools::document()
devtools::install()

usethis::use_git_config(user.name = "mariojrepisus", user.email = "mariojr.episus@gmail.com")

usethis::use_git()

usethis::create_github_token()

gitcreds::gitcreds_set()


usethis::use_github()


remotes::install_github("mariojrepisus/episusTools")
