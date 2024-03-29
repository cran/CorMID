testthat::test_that(
  desc = "calc_mid_error returns expected result",
  code = {
    md <- c(50,100,10,0,50,50); md <- md/sum(md); names(md) <- paste0("M", formatC(x = -1:4, format = "d", flag = "+"))
    mid <- c(0.7,0,0,0,0.3); names(mid) <- paste0("M",0:4)
    best_r <- unlist(list("M+H"=0.9,"M+"=0.1))
    fml <- "C19H37NO4Si3"; attr(fml, "nmz") <- 6
    rMID <- CorMID::recMID(mid = mid, fml = fml, r = best_r)
    out <- CorMID:::calc_mid_error(md=md, reconstructed_mid=rMID[1:6], best_r=best_r)
    testthat::expect_equal(length(out), 1L)
    testthat::expect_true(is.numeric(out))
  }
)
