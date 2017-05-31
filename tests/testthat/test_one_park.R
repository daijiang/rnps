context("Get species list for one park")

test_that("Codes for parks", {
  expect_warning(get_one_park(parkcode = "OLST", categcode = 11, searchlevel = 3),
                 "No results. Please make sure the park code OLST is correct.")
  c1_out = get_one_park(parkcode = "ABLI", categcode = 11)
  expect_is(c1_out, "data.frame")
  expect_named(c1_out[, 1:2], c('DataStoreReferences', 'DataStoreReferencesCount'))
  expect_equal(unique(c1_out$UnitCode), "ABLI")
  expect_is(c1_out$SciName, "character")

  c1_out = get_one_park(parkcode = "ABLI", categcode = 11)
  expect_is(c1_out, "data.frame")
  expect_equal(ncol(c1_out) > 20, TRUE)

  c1_out = get_one_park(parkcode = "ABLI", categcode = 2, searchlevel = 3)
  expect_is(c1_out, "data.frame")
  expect_true(all(c("Nativeness", "NPSTags") %in% names(c1_out)))

  c1_out = get_one_park(parkcode = "ABLI", categcode = 11, searchlevel = 1)
  expect_is(c1_out, "data.frame")
  expect_equal(ncol(c1_out) > 18, TRUE)

})
