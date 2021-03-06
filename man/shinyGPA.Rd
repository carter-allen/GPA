\name{shinyGPA}
\alias{shinyGPA}
\title{
Run ShinyGPA app
}
\description{
Run ShinyGPA app.
}
\usage{
shinyGPA( out=NULL )
}
%- maybe also 'usage' for other objects documented here.
\arguments{
    \item{out}{output of \code{fitAll} function. }
}
\details{
\code{shinyGPA} runs the ShinyGPA app. It takes the output of the \code{fitAll} function, which fits the GPA model for all possible pairs of GWAS datasets, as input.
}
\value{
Provides visualization to investigate pleiotropic architecture using GWAS results.
}
\references{
Kortemeier E, Ramos PS, Hunt KJ, Kim HJ, Hardiman G, and Chung D (2018),
"ShinyGPA: An interactive and dynamic visualization toolkit for genetic studies,"
PLOS One, 13(1): e0190949.
}
\author{ Dongjun Chung, Emma Kortemeier }
\seealso{
\code{\link{fitAll}}.
}
\examples{

# simulator function

simulator <- function( risk.ind, nsnp=20000, alpha=0.6 ) {
  
  m <- length(risk.ind)
  
  p.sig <- rbeta( m, alpha, 1 )
  pvec <- runif(nsnp)
  pvec[ risk.ind ] <- p.sig
  
  return(pvec)
}

# run simulation

set.seed(12345)
nsnp <- 1000
alpha <- 0.3
pmat <- matrix( NA, nsnp, 5 )

pmat[,1] <- simulator( c(1:200), nsnp=nsnp, alpha=alpha )
pmat[,2] <- simulator( c(51:250), nsnp=nsnp, alpha=alpha )
pmat[,3] <- simulator( c(401:600), nsnp=nsnp, alpha=alpha )
pmat[,4] <- simulator( c(451:750), nsnp=nsnp, alpha=alpha )
pmat[,5] <- simulator( c(801:1000), nsnp=nsnp, alpha=alpha )

# Fit GPA for all possible pairs of GWAS datasets

out <- fitAll( pmat, maxIter = 100 )

# Run the ShinyGPA app using the ouput from fitAll()

# shinyGPA(out)

}
\keyword{models}
\keyword{methods}
