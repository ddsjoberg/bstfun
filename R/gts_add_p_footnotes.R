#' Moves p-value footnotes to individual p-values
#'
#' @param x object with class `"tbl_summary"` created from the gtsummary package
#' @param printer DEPRECATED
#' @param index_start DEPRECATED
#'
#' @export
#' @family gtsummary-related functions
#' @examples
#' library(gtsummary)
#' gts_add_p_footnotes_ex1 <-
#'   trial %>%
#'   select(trt, age, grade) %>%
#'   tbl_summary(by = trt) %>%
#'   add_p() %>%
#'   gts_add_p_footnotes()
#'
#' @section Example Output:
#' \if{html}{\figure{gts_add_p_footnotes_ex1.png}{options: width=80\%}}

gts_add_p_footnotes <- function(x, printer = NULL, index_start = NULL) {
  # check inputs ---------------------------------------------------------------
  if (!inherits(x, "gtsummary") || !"p.value" %in% names(x$table_body))
    stop("x must be a gtsummary table with a p-value column.", call. = FALSE)
  if (!"stat_test_lbl" %in% names(x$meta_data))
    stop("The `x$meta_data` data frame must have a column called 'stat_test_lbl'.")

  if (!is.null(printer) || !is.null(index_start))
    paste("Arguments `printer=` and `index_start=` are deprecated and were ignored.",
          "gtsummary table is no longer converted to gt or flextable; rather,",
          "it maintains its gtsummary class.") %>%
    message()

  # remove p-value column footnote ---------------------------------------------
  x <- gtsummary::modify_footnote(x, p.value ~ NA_character_)

  # add footnotes to the body of the table -------------------------------------
  footnote_calls <-
    x$meta_data %>%
    dplyr::select(.data$variable, .data$stat_test_lbl) %>%
    tibble::deframe() %>%
    purrr::imap(
      ~rlang::expr(
        gtsummary::modify_table_styling(columns = "p.value",
                                        rows = .data$variable %in% !!.y & !is.na(.data$p.value),
                                        footnote = !!.x)
      )
    )

  # concatenating expressions with %>% between each of them
  footnote_calls %>%
    purrr::reduce(function(x, y) rlang::expr(!!x %>% !!y), .init = rlang::expr(!!x)) %>%
    # evaluating expressions
    eval()
}


#' Check that a package is installed, stopping otherwise
#'
#' @param pkg Package required
#' @param fn Calling function from the user perspective
#'
#' @family gtsummary-related functions
#' @return Returns NULL or not at all.
#'
#' @noRd
#' @keywords internal
assert_package <- function(pkg, fn, version = NULL) {
  if (is.null(version) && !requireNamespace(pkg, quietly = TRUE)) {
    ui_oops("The {ui_value(pkg)} package is required for function {ui_code(fn)}.")
    usethis::ui_todo("Install {ui_value(pkg)} with the code below.")
    ui_code_block('install.packages("{pkg}")')
    stop("Install required package", call. = FALSE)
  }

  if (!is.null(version) &&
      (!requireNamespace(pkg, quietly = TRUE) ||
       (requireNamespace(pkg, quietly = TRUE) && utils::packageVersion(pkg) < version))) {
    ui_oops("The {ui_value(pkg)} package v{version} or greater is required for function {ui_code(fn)}.")
    usethis::ui_todo("Install/update {ui_value(pkg)} with the code below.")
    ui_code_block('install.packages("{pkg}")')
    stop("Install required package", call. = FALSE)
  }
}



