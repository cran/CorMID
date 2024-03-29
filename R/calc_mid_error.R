#' @title calc_mid_error.
#' @description \code{calc_mid_error} will compute the error of a theoretical and a estimated mid.
#' @param md Normalized measured intensities
#' @param reconstructed_mid A reconstructed MID based on a true MID and a theoretical distribution.
#' @param best_r A named numeric vector of fragment ratios.
#' @return A numeric vector of length(x).
#' @keywords internal
#' @noRd
calc_mid_error <- function(md=NULL, reconstructed_mid=NULL, best_r=NULL) {
  known_frags <- unlist(list("M+H"=0,"M+"=-1,"M-H"=-2,"M+H2O-CH4"=+2))
  length_md <- length(md)
  T0 <- rep(0, max(known_frags))
  frag <- as.numeric(gsub("M","",names(md)))
  out <- rep(0, length_md)
  names(out) <- names(md)
  for (i in 1:length(best_r)) {
    # compute necessary leading and trailing zeros
    L0 <- rep(0, which(frag==known_frags[names(known_frags) %in% names(best_r)[i]])-1)
    # reconstruct the MID for this adduct
    rMID <- reconstructed_mid*unlist(best_r[i])
    # add the MID for this adduct
    out <- out + c(L0, rMID, T0)[1:length_md]
  }
  # normalized and calculate error for this mid
  # $$ the following line led to serious problems and was outcommented on 2022-03-16 by JL
  #if (sum(out)!=1 & sum(out)!=0) out <- out/sum(out)
  mid_err <- sqrt(sum((out-md)^2))
  return(mid_err)
}
