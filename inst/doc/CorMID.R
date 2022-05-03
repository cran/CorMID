## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(CorMID)

## ----CountChemicalElements----------------------------------------------------
fml <- "C6H12O6T5M1"
CountChemicalElements(x = fml)
CountChemicalElements(x = fml, ele=c("C","Si","T","Cl"))

## ----CalcTheoreticalMDV1------------------------------------------------------
fml <- "C21Si5"
td <- CalcTheoreticalMDV(fml=fml)
round(td,4)

## ----CalcTheoreticalMDV2------------------------------------------------------
round(CalcTheoreticalMDV(fml=fml, nbio=21, nmz=21)[-(5:19),-(5:19)],4)

## ----recMID-------------------------------------------------------------------
fml <- "C9H20O3Si2"
mid <- c(0.9,0,0,0.1)
r <- list("M+H"=0.8, "M-H"=0.1, "M+H2O-CH4"=0.1)
(rMID <- CorMID::recMID(mid=mid, r=r, fml=fml))
plot(rMID)

## ----CorMID1------------------------------------------------------------------
fml <- "C21Si5"
td1 <- CalcTheoreticalMDV(fml = fml, nbio=6, nmz=8)
bMID <- c(0.9,rep(0,5),0.1)
md1 <- apply(td1*bMID,2,sum)
round(md1,4)

## ----CorMID2------------------------------------------------------------------
CorMID(int=md1, fml=fml, r=unlist(list("M+H"=1)))

## ----CorMID3------------------------------------------------------------------
CorMID(int=md1, fml=fml)

## ----CorMID4------------------------------------------------------------------
md2 <- unlist(list("M-1"=0,0.8*md1)) + c(0.2*md1,0)
round(md2,4)

## ----CorMID5------------------------------------------------------------------
CorMID(int=md2, fml=fml)

## ----poss_local_demo1---------------------------------------------------------
CorMID:::poss_local(vec=c(0.5,0.5,0.5), d=0.5, length.out=3)

## ----poss_local_demo2---------------------------------------------------------
CorMID:::poss_local(vec=c(1,0,0), d=0.25, length.out=3)

