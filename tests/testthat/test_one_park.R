context("Get species list for one park")

test_that("Codes for parks", {
  nps_code = get_nps_code()$UnitCode
  expect_warning(get_one_park(parkcode = "OLST", categcode = 11),
                 "No results. Please make sure the park code OLST is correct.")
  c1_out = get_one_park(parkcode = "ACAD", categcode = 11)
  expect_is(c1_out, "data.frame")
  expect_named(c1_out[, 1:2], c("Nativeness", "UnitCode"))
  expect_equal(unique(c1_out$UnitCode), "ACAD")
  expect_is(c1_out$SciName, "character")
  expect_equal(ncol(c1_out), 23)
})
