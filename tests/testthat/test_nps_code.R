context("nps_code & taxa id")

test_that("Codes for parks", {
  nps_code = get_nps_code()
  expect_is(nps_code, "data.frame")
  expect_named(nps_code, c("UnitCode", "FullName"))
  expect_is(nps_code$UnitCode, "character")
  expect_is(nps_code$FullName, "character")
})

test_that("Id for taxa groups", {
  taxa_code = get_taxa_code()
  expect_is(taxa_code, "data.frame")
  expect_named(taxa_code, c("Id", "Name"))
  expect_is(taxa_code$Id, "integer")
  expect_is(taxa_code$Name, "character")
})
