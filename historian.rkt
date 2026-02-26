#lang racket/base

(define [main]
  (define args (current-command-line-arguments))
  (define args-len (vector-length args))

  (unless [args-len-valid? args-len]
    [begin
      (printf "Invalid number of arguments\n\n")
      (display-help-options)
      (exit 1)])

  ; (displayln [ve-ref args 0])
  (displayln "DEBUG - good so far"))

(define [args-len-valid? len]
    (= len 1))

(define [display-help-options]
  (displayln "\033[1mhistorian\033[22m does not take CLI args other than mode (defined blow).")
  (displayln "Once mode is selected, further inputs can be made\n")
  (displayln "-a  Add new entry")
  (displayln "-s  Search entries using keyword")
  (displayln "-c  Copy entry using ID"))

(main)
