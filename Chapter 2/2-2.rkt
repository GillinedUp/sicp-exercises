#lang sicp

; abstraction barrier: middpoint-segment package, depends on segment and point package

(define (midpoint-segment s)
  (make-point
   (average (x-point (start-segment s))
            (x-point (end-segment s)))
   (average (y-point (start-segment s))
            (y-point (end-segment s)))))

; abstraction barrier: segment package, depends on pair and average packages

(define (make-segment start end)
  (cons start end))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

; abstraction barrier: print-point package, depends on point package

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

; abstraction barrier: point package, depends on pair package

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

; abstraction barrier: average package

(define (average a b)
  (/ (+ a b) 2.0))
 