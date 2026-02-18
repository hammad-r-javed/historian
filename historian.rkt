#lang racket

(require [prefix-in tui: charterm])

(define [main]
  (tui:with-charterm
    (tui:charterm-clear-screen)
    (tui:charterm-cursor 1 1)
    (tui:charterm-display "DEBUG Press a key...")
    (let [(key (tui:charterm-read-key))]
      (handle-key key))))

(define [handle-key key]
  (match key
    [#f (display "ERROR - input timed out")]
    [(? char? c) (display-key c)]
    [(? symbol? s) (display-symbol s)]))

(define [display-symbol key]
  (define [symbol-to-string]
    (match key
      ['return "enter"]
      ['up "up"]
      ['down "down"]
      ['left "left"]
      ['right "right"]
      [_ "ERROR - No matching key symbol found"]))
  (tui:charterm-clear-screen)
  (tui:charterm-cursor 1 1)
  (tui:charterm-display (format"DEBUG symbol received ~s" [symbol-to-string])))

(define [display-key key]
  (tui:charterm-clear-screen)
  (tui:charterm-cursor 1 1)
  (printf "DEBUG char received ~s" [string key]))

(define [display-bold s]
  (tui:charterm-bold)
  (tui:charterm-display s)
  (tui:charterm-normal))

(main)
