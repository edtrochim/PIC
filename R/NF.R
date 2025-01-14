# n factor for freezing

NF <- function(Year, AirTempName, GroundTempName, data=QTP_ATM, SID, ...) {
  
  nf_a <- sapply(Year, function(Year) tryCatch({
    Freezing_index(Year=Year, TempName=GroundTempName, data=data, SID=SID)
    }, error = function ( e ) {nf_a <- NA}
    , warning = function ( e ) {nf_a <- NA}
  ), simplify=T)
    
  nf_b <- sapply(Year, function(Year) tryCatch({  
    Freezing_index(Year=Year, TempName=AirTempName, data=data, SID=SID)
  }, error = function ( e ) {nf_b <- NA}
    , warning = function ( e ) {nf_b <- NA}
  ), simplify=T)
  
  nf <- nf_a/nf_b
  
  names(nf) <- Year
  return(nf)
}
