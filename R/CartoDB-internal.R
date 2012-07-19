# .CartoDB <-
# <environment>
.CartoDB<-new.env()
.CartoDB$data<-list()

# .onLoad <-
# function (libname, pkgname) 
# {
#     op <- options()
#     op.utils <- list(help.try.all.packages = FALSE, help.search.types = c("vignette", 
#         "demo", "help"), internet.info = 2, pkgType = .Platform$pkgType, 
#         str = list(strict.width = "no", digits.d = 3, vec.len = 4), 
#         demo.ask = "default", example.ask = "default", HTTPUserAgent = defaultUserAgent(), 
#         menu.graphics = TRUE, mailer = "mailto")
#     extra <- if (.Platform$OS.type == "windows") {
#         list(unzip = "internal", editor = if (length(grep("Rgui", 
#             commandArgs(), TRUE))) "internal" else "notepad", 
#             repos = c(CRAN = "@CRAN@", CRANextra = "http://www.stats.ox.ac.uk/pub/RWin"))
#     }
#     else list(unzip = Sys.getenv("R_UNZIPCMD"), editor = Sys.getenv("EDITOR"), 
#         repos = c(CRAN = "@CRAN@"))
#     op.utils <- c(op.utils, extra)
#     toset <- !(names(op.utils) %in% names(op))
#     if (any(toset)) 
#         options(op.utils[toset])
# }

# .onLoad<-function(libname, pkgname) {
#     if(is.null(.CartoDB$data)==FALSE) {
#         .CartoDB$data <- list(
#             api.key=NULL,
#             account.name=NULL,
#             api.sql=".cartodb.com/api/v2/sql",
#             api.maps=".cartodb.com/tiles/"
#             )
#     }
# }