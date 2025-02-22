% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/lines.R
\name{read_lines}
\alias{read_lines}
\alias{read_lines_raw}
\alias{write_lines}
\title{Read/write lines to/from a file}
\usage{
read_lines(
  file,
  skip = 0,
  skip_empty_rows = FALSE,
  n_max = Inf,
  locale = default_locale(),
  na = character(),
  lazy = TRUE,
  num_threads = readr_threads(),
  progress = show_progress()
)

read_lines_raw(
  file,
  skip = 0,
  n_max = -1L,
  num_threads = readr_threads(),
  progress = show_progress()
)

write_lines(
  x,
  file,
  sep = "\\n",
  na = "NA",
  append = FALSE,
  num_threads = readr_threads(),
  path = deprecated()
)
}
\arguments{
\item{file}{Either a path to a file, a connection, or literal data
(either a single string or a raw vector).

Files ending in \code{.gz}, \code{.bz2}, \code{.xz}, or \code{.zip} will
be automatically uncompressed. Files starting with \verb{http://},
\verb{https://}, \verb{ftp://}, or \verb{ftps://} will be automatically
downloaded. Remote gz files can also be automatically downloaded and
decompressed.

Literal data is most useful for examples and tests. To be recognised as a
path, it must be wrapped with \code{I()}, be a string containing at least one
new line, or be a vector containing at least one string with a new line.

Using a value of \code{\link[=clipboard]{clipboard()}} will read from the system clipboard.}

\item{skip}{Number of lines to skip before reading data.}

\item{skip_empty_rows}{Should blank rows be ignored altogether? i.e. If this
option is \code{TRUE} then blank rows will not be represented at all.  If it is
\code{FALSE} then they will be represented by \code{NA} values in all the columns.}

\item{n_max}{Number of lines to read. If \code{n_max} is -1, all lines in
file will be read.}

\item{locale}{The locale controls defaults that vary from place to place.
The default locale is US-centric (like R), but you can use
\code{\link[=locale]{locale()}} to create your own locale that controls things like
the default time zone, encoding, decimal mark, big mark, and day/month
names.}

\item{na}{Character vector of strings to interpret as missing values. Set this
option to \code{character()} to indicate no missing values.}

\item{lazy}{Read values lazily? By default the file is initially only
indexed and the values are read lazily when accessed. Lazy reading is
useful interactively, particularly if you are only interested in a subset
of the full dataset. Note, lazy reading on windows will lock the file
until all the data has been read from it, if you run into this issue set
\code{lazy = FALSE}.}

\item{num_threads}{The number of processing threads to use for initial
parsing and lazy reading of data. If your data contains newlines within
fields the parser should automatically detect this and fall back to using
one thread only. However if you know your file has newlines within quoted
fields it is safest to set \code{num_threads = 1} explicitly.}

\item{progress}{Display a progress bar? By default it will only display
in an interactive session and not while knitting a document. The automatic
progress bar can be disabled by setting option \code{readr.show_progress} to
\code{FALSE}.}

\item{x}{A character vector or list of raw vectors to write to disk.}

\item{sep}{The line separator. Defaults to \verb{\\\\n}, commonly used on POSIX
systems like macOS and linux. For native windows (CRLF) separators use
\verb{\\\\r\\\\n}.}

\item{append}{If \code{FALSE}, will overwrite existing file. If \code{TRUE},
will append to existing file. In both cases, if the file does not exist a new
file is created.}

\item{path}{\Sexpr[results=rd, stage=render]{lifecycle::badge("deprecated")}, use the \code{file} argument instead.}
}
\value{
\code{read_lines()}: A character vector with one element for each line.
\code{read_lines_raw()}: A list containing a raw vector for each line.

\code{write_lines()} returns \code{x}, invisibly.
}
\description{
\code{read_lines()} reads up to \code{n_max} lines from a file. New lines are
not included in the output. \code{read_lines_raw()} produces a list of raw
vectors, and is useful for handling data with unknown encoding.
\code{write_lines()} takes a character vector or list of raw vectors, appending a
new line after each entry.
}
\examples{
read_lines(file.path(R.home("doc"), "AUTHORS"), n_max = 10)
read_lines_raw(file.path(R.home("doc"), "AUTHORS"), n_max = 10)

tmp <- tempfile()

write_lines(rownames(mtcars), tmp)
read_lines(tmp, lazy = FALSE)
read_file(tmp) # note trailing \n

write_lines(airquality$Ozone, tmp, na = "-1")
read_lines(tmp)
}
