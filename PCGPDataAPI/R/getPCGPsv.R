
.getPCGPsv <- function (x){
  
  datatypeextension <- "sv"

  PCGPbaseURL <- getPCGPbaseURL()
  PCGPsamplelist <- getPCGPsamplelist()

  if (missing(x)){
    samples <- unlist(PCGPsamplelist[,"Patient"])
  }

  if (!missing(x)){
    if (x != "all"){
      samples <- intersect (x, PCGPsamplelist[,"Patient"])
    }
    
    if (x == "all"){
      samples <- PCGPsamplelist[,"Patient"]
    }
    
  }

  if (length (samples) > 0){
    sv <- read.csv(
            paste(PCGPbaseURL, "patient/", datatypeextension, ".csv?r=&l2r=true&t=&a=HG19&p=", paste(samples, collapse=","), sep=""), stringsAsFactors=FALSE, as.is=TRUE, row.names=NULL
            )
                                        #n.rows <- unlist(lapply(tables, function(t) dim(t)[1]))
                                        #sv <- tables[[which.max(n.rows)]]
    
    colnames (sv) <- gsub ("\n", "", colnames (sv))
    colnames (sv) <- gsub ("\t", "", colnames (sv))
    
    
    return(sv)
  }
  
  if (length (samples) == 0){
    cat ("No valid sample name provided\n")
  }
  
}


