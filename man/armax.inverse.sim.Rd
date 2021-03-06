% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/armax.inverse.sim.R
\name{armax.inverse.sim}
\alias{armax.inverse.sim}
\alias{expuh.inverse.sim}
\title{Invert transfer function models to estimate input series.}
\usage{
armax.inverse.sim(
  DATA,
  a_1 = 0,
  a_2 = 0,
  a_3 = 0,
  b_0 = 1,
  b_1 = 0,
  b_2 = 0,
  b_3 = 0,
  pars = NULL,
  delay = 0,
  init = 0,
  rain.factor = 1.1,
  rises.only = FALSE,
  use.Qm = TRUE,
  use.fft.method = FALSE,
  constrain.fft = TRUE,
  mass.balance = use.fft.method,
  scale.window = NA
)
}
\arguments{
\item{DATA}{time-series-like object with columns \code{Q} (streamflow) and
optionally \code{P} (precipitation).}

\item{a_1}{Placeholder}

\item{a_2}{Placeholder}

\item{a_3}{Placeholder}

\item{b_0}{Placeholder}

\item{b_1}{Placeholder}

\item{b_2}{Placeholder}

\item{b_3}{Placeholder}

\item{pars}{Placeholder}

\item{delay}{delay (lag time / dead time) in number of time steps.}

\item{init}{Placeholder}

\item{rain.factor}{Placeholder}

\item{rises.only}{Placeholder}

\item{use.Qm}{Placeholder}

\item{use.fft.method}{Placeholder}

\item{constrain.fft}{Placeholder}

\item{mass.balance}{Placeholder}

\item{scale.window}{Placeholder}
}
\description{
Invert transfer function models to estimate input series.
}
\examples{

## baseflow filtering using two-store unit hydrograph
data(Murrindindi)
x <- Murrindindi[1:1000, ]

## case 1 (preferred): streamflow + rainfall data constrained
## such that effective rainfall is less than observed rainfall
foo <- hydromad(x,
  sma = "armax.inverse", routing = "armax",
  rfit = list("inverse", order = c(2, 1))
)
foo
xsq <- predict(foo, return_components = TRUE)
xyplot(cbind(observed = x$Q, slow_component = xsq$Xs), superpose = TRUE)

## case 2: using streamflow data only, constrained
## to have effective rainfall only when flow is rising
foo <- hydromad(x$Q,
  sma = "armax.inverse", routing = "armax",
  rfit = list("inverse", order = c(2, 1), rises.only = TRUE)
)
xsq <- predict(foo, return_components = TRUE)
xyplot(cbind(observed = x$Q, slow_component = xsq$Xs), superpose = TRUE)

## case 3: using streamflow data only, unconstrained
foo <- hydromad(x$Q,
  sma = "armax.inverse", routing = "armax",
  rfit = list("inverse", order = c(2, 1))
)
xsq <- predict(foo, return_components = TRUE)
xyplot(cbind(observed = x$Q, slow_component = xsq$Xs), superpose = TRUE)
}
\references{
...
}
\seealso{
\code{\link{armax.inverse.fit}}, \code{\link{armax}},
\code{\link{expuh}}
}
\author{
Felix Andrews \email{felix@nfrac.org}
}
\keyword{ts}
