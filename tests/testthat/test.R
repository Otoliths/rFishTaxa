context("test")

test_that("Target species can be passed as search_* functions", {
  res <- search_cas(query = "Anguilla nebulosa",type = "species")
  expect_match(res$species, "Anguilla nebulosa")
})
