library(jsonlite)
library(RCurl)
library(tibble)

source("Rcode/utilis.R")

nps_code = get_nps_code()
taxa_code = get_taxa_code()

if(!file.exists("data/nps_plants.rda")){
  # plant list, will take a while to run
  nps_plants = plyr::ldply(nps_code$UnitCode,
                           function(x) get_one_park(parkcode = x,
                                                    categcode = 11)) %>%
    tbl_df()

  devtools::use_data(nps_plants, compress = "xz", overwrite = T)
}

if(!file.exists("data/nps_birds.rda")){
  nps_birds = plyr::ldply(nps_code$UnitCode,
                          function(x) get_one_park(parkcode = x,
                                                   categcode = 2)) %>%
    tbl_df()

  devtools::use_data(nps_birds, compress = "xz", overwrite = T)
}
