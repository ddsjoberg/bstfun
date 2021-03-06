% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_biostat_project.R
\name{create_bst_project}
\alias{create_bst_project}
\title{Start a New Biostatistics project}
\usage{
create_bst_project(
  path,
  path_data = NULL,
  template = NULL,
  git = NA,
  renv = TRUE,
  overwrite = NA,
  open = interactive()
)
}
\arguments{
\item{path}{A path. If it exists, it is used. If it does not exist, it is
created.}

\item{path_data}{A path. The directory where the secure data exist. Default is
\code{NULL}.  When supplied, a symbolic link to data folder will be created.}

\item{template}{Specifies template for \code{starter::create_project(template=)}.
Default is the template in \code{bstfun::project_templates} whose name matches
the lowercase system username, if it exists;
otherwise, \code{bstfun::project_templates[["default"]]}}

\item{git}{Logical indicating whether to create Git repository.  Default is \code{TRUE}
When \code{NA}, user will be prompted whether to initialise Git repo.}

\item{renv}{Logical indicating whether to add renv to a project.
Default is \code{TRUE}. When \code{NA} which interactively asks user preference.}

\item{overwrite}{Overwrite any existing files if they exist.  Options are
\code{TRUE}, \code{FALSE}, and \code{NA} (aka ask interactively).  Default is \code{NA}}

\item{open}{Logical indicating whether to open new project in fresh RStudio
session}
}
\description{
Creates a directory with the essential files for a new project.
The function can be used on existing project directories as well.
This is a thin wrapper for \code{starter::create_project()} that
sets the default template to \code{template = hotfun::project_template}
}
\examples{
\dontrun{\donttest{
# specifying project folder location (folder does not yet exist)
project_path <- fs::path(tempdir(), "My Project Folder")

# creating folder where secure data would be stored (typically will be a network drive)
secure_data_path <- fs::path(tempdir(), "secure_data")
dir.create(secure_data_path)

# creating new project folder
create_bst_project(project_path, path_data = secure_data_path)
}}
}
