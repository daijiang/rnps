
rnps
====

[![Build Status](https://travis-ci.org/daijiang/rnps.svg?branch=master)](https://travis-ci.org/daijiang/rnps) [![Coverage Status](https://img.shields.io/codecov/c/github/daijiang/rnps/master.svg)](https://codecov.io/github/daijiang/rnps?branch=master)

**R** package to get **N**ational **P**ark **S**ervices' species Lists.

You can install this package with

```r
install.packages("devtools")
devtools::install_github("daijiang/rnps")
```

Overview
--------

This package is set to help download species lists (at this moment, may extend to download other data) from park units managed by [National Park Services](https://www.nps.gov). The website we download from is [NPSpecies](https://irma.nps.gov/NPSpecies/Search/SpeciesList), which includes &gt;500 park units for 17 taxa groups. I have downloaded all available records for plants (`rnps::nps_plants`) and birds (`rnps::nps_birds`) in this package since it takes a while to do so.

To check all park units, use

``` r
rnps::get_nps_code()
```

    ## # A tibble: 532 x 2
    ##    UnitCode                                                   FullName
    ##  *    <chr>                                                      <chr>
    ##  1     ABLI Abraham Lincoln Birthplace National Historical Park (ABLI)
    ##  2     ACAD                                Acadia National Park (ACAD)
    ##  3     ADAM                      Adams National Historical Park (ADAM)
    ##  4     AFAM                 African American Civil War Memorial (AFAM)
    ##  5     AFBG             African Burial Ground National Monument (AFBG)
    ##  6     AGFO                 Agate Fossil Beds National Monument (AGFO)
    ##  7     ALKA                Ala Kahakai National Historic Trail  (ALKA)
    ##  8     ALAG                                  Alagnak Wild River (ALAG)
    ##  9     ALCA                                    Alcatraz Island  (ALCA)
    ## 10     ALEU       Aleutian World War II National Historic Area  (ALEU)
    ## # ... with 522 more rows

To check all taxa groups, use

``` r
rnps::get_taxa_code()
```

    ##    Id                  Name
    ## 1   1               Mammals
    ## 2   2                 Birds
    ## 3   4              Reptiles
    ## 4   5            Amphibians
    ## 5   3                  Fish
    ## 6  11       Vascular Plants
    ## 7  12   Non-vascular Plants
    ## 8   7  Crab/Lobsters/Shrimp
    ## 9   9          Slugs/Snails
    ## 10  6     Spiders/Scorpions
    ## 11  8               Insects
    ## 12 10 Other Non-vertebrates
    ## 13 13                 Fungi
    ## 14 14              Protozoa
    ## 15 16             Chromista
    ## 16 15              Bacteria
    ## 17 17               Archaea

To get species list of one taxa group at a specific park, use

``` r
rnps::get_one_park(parkcode = "ACAD", categcode = 3) # 3 for fish
```

    ## # A tibble: 38 x 22
    ##    Abundance Nativeness UnitCode             UnitName     Id IsAccepted
    ##  *     <chr>      <chr>    <chr>                <chr>  <int>      <lgl>
    ##  1  Abundant     Native     ACAD Acadia National Park 138231       TRUE
    ##  2   Unknown     Native     ACAD Acadia National Park 359763       TRUE
    ##  3    Common     Native     ACAD Acadia National Park 205714       TRUE
    ##  4   Unknown    Unknown     ACAD Acadia National Park   4464       TRUE
    ##  5   Unknown    Unknown     ACAD Acadia National Park 166792       TRUE
    ##  6    Common     Native     ACAD Acadia National Park  71630       TRUE
    ##  7  Uncommon Non-native     ACAD Acadia National Park 247290       TRUE
    ##  8  Abundant     Native     ACAD Acadia National Park  74266       TRUE
    ##  9    Common     Native     ACAD Acadia National Park  80516       TRUE
    ## 10      <NA>    Unknown     ACAD Acadia National Park 248367       TRUE
    ## # ... with 28 more rows, and 16 more variables: RecordStatus <chr>,
    ## #   Occurrence <chr>, TaxonCode <chr>, SciName <chr>, Rank <chr>,
    ## #   Kingdom <chr>, CategoryName <chr>, NPSpeciesCategorySortOrder <int>,
    ## #   Order <chr>, Family <chr>, CommonNames <chr>, SourceName <chr>,
    ## #   ExternalCode <chr>, LifecycleState <chr>, NumberOfParks <int>,
    ## #   OccurrenceTags <chr>

Further ideas
-------------

It is possible to also download other information about national parks, such as area, visitors, etc in the future. Contributes are welcome.
