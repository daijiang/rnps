#' get unicode and full names of national park units
#' @examples
#' nps_code = get_nps_code()
#' @export
get_nps_code = function(){
  tibble::as.tibble(jsonlite::fromJSON("https://irma.nps.gov/NPSpecies/Lookup/GetAllUnits"))
}

#' get code for taxa groups
#' @examples
#' taxa_code = get_taxa_code()
#' @export
#'
get_taxa_code = function(){
  jsonlite::fromJSON("https://irma.nps.gov/NPSpecies/Lookup/GetAllTaxonCategories")
}

#' get species list for one park from https://irma.nps.gov/NPSpecies/Search/SpeciesList
#' @param parkcode four digits code for parks from `rnpsp::get_nps_code()$UnitCode`.
#' @param categcode taxa groups code from `rnpsp::get_taxa_code()$Id`.
#'    Id                  Name
#' 1   1               Mammals
#' 2   2                 Birds
#' 3   4              Reptiles
#' 4   5            Amphibians
#' 5   3                  Fish
#' 6  11       Vascular Plants
#' 7  12   Non-vascular Plants
#' 8   7  Crab/Lobsters/Shrimp
#' 9   9          Slugs/Snails
#' 10  6     Spiders/Scorpions
#' 11  8               Insects
#' 12 10 Other Non-vertebrates
#' 13 13                 Fungi
#' 14 14              Protozoa
#' 15 16             Chromista
#' 16 15              Bacteria
#' 17 17               Archaea
#' @param searchlevel the level of search: 1: checklist; 2: full list; 3: full list with detaisl. Default is 3.
#' @export
#' @examples
#' get_one_park("ABLI", 11)
get_one_park = function(parkcode = "ACAD", categcode = 11, searchlevel = 3){
  cat(parkcode, " \t")

  if(searchlevel == 1){
    url = "https://irma.nps.gov/NPSpecies/Search/GetSpeciesListChecklistResults"
  }
  if(searchlevel == 2){
    url = "https://irma.nps.gov/NPSpecies/Search/GetSpeciesListFullListResults"
  }
  if(searchlevel == 3){
    url = "https://irma.nps.gov/NPSpecies/Search/GetSpeciesListFullListWithDetailsResults"
  }

  output = RCurl::postForm(uri = url,
                    .params = list(UnitCode = parkcode,
                                   CategoryCode = categcode),
                    .opts = RCurl::curlOptions(referer = "https://irma.nps.gov/NPSpecies/Search/SpeciesList")
  )

  output = as.data.frame(jsonlite::fromJSON(output)$Results, stringsAsFactors = FALSE)

  if(nrow(output) == 0) {
    warning("No results. Please make sure the park code ", parkcode, " is correct.")
    return()
  }

  tibble::as.tibble(output)
}
