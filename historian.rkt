#lang racket

; FUNCTIONS

(define [args-len-valid? len]
    (= len 2))

(define [add-entry entry-string]
  (displayln "DEBUG - add-entry called"))

(define [search-entries keyword]
  (displayln "DEBUG - search-entries called"))

(define [copy-entry entry-id]
  (displayln "DEBUG - copy-entry called"))

; TODO - Need more informative error messaging
(define [invalid-args-early-return]
    (printf "Invalid args\n\n")
    (display-help-options)
    (exit 1))

(define [display-help-options]
  (displayln "\033[1mhistorian\033[22m\n")
  (displayln "Usage - historian <command> <arg>")
  (displayln "Valid commands and args")
  (displayln "-a <string>  Add new entry")
  (displayln "-s <string>  Search entries using keyword")
  (displayln "-c <string>  Copy entry using ID obtained using search"))

; DATA

(define args (current-command-line-arguments))
(define args-len (vector-length args))
(define args-func-map
  [hash "-a" add-entry
        "-s" search-entries
        "-c" copy-entry])

; MAIN

(define [main]
  (unless [args-len-valid? args-len]
    (invalid-args-early-return))

  (define action [hash-ref args-func-map (vector-ref args 0) #f])
  (match action
    [#f (invalid-args-early-return)]
    [_  (action [vector-ref args 1])]))

(main)
