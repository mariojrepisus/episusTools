usethis::create_package("C:/Users/mario.junior/OneDrive/Documentos/r/episus_tools")

usethis::use_git_config(user.name = "Seu Nome", user.email = "seu.email@example.com")

devtools::document()
devtools::install()

usethis::use_git_config(user.name = "mariojrepisus", user.email = "mariojr.episus@gmail.com")

usethis::use_git()

usethis::create_github_token()

gitcreds::gitcreds_set()


usethis::use_github()


usethis::use_git_remote(
  name = "origin",
  url = "https://github.com/mariojrepisus/episusTools.git"
)


system("git add .")
system('git commit -m "mensagem do commit"')
system("git push origin main")

usethis::git_add()
usethis::git_commit("mensagem do commit")


remotes::install_github("mariojrepisus/episusTools")


devtools::document()


devtools::load_all()

devtools::check()


usethis::use_version("patch")
