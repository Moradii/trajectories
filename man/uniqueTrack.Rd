\name{uniqueTrack}
\alias{uniqueTrack}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
uniqueTrack
}
\description{
Removing duplicated points in a track}
\usage{
uniqueTrack(x)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
an object of class "Track"
}
}
\details{
This function removes duplicated points in an object of class "Track".}
\value{
An object of class Track with  no duplicated point.}
\references{
%% ~put references to the literature/web site here ~
}
\author{
Mohammad Mehdi Moradi <moradi@uji.es>
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
rTrack, rTracks, rTracksCollection
}
\examples{
x <-  rTrack()
uniqueTrack(x)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }% use one of  RShowDoc("KEYWORDS")
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line