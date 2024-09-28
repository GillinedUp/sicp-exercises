#lang sicp

; abstraction barrier

(define (midpoint-segment s)
  (define (average a b)
    (/ (+ a b) 2.0))
  (make-point
   (average (x-point (start-segment s))
            (x-point (end-segment s)))
   (average (y-point (start-segment s))
            (y-point (end-segment s)))))

; abstraction barrier

(define (make-segment start end)
  (cons start end))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

; abstraction barrier

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

; abstraction barrier

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))
