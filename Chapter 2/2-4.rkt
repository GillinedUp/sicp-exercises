#lang sicp

; return a procedure that accepts a selector procedure and applies it to its parameters

(define (cons x y)
  (lambda (m) (m x y)))

; take a procedure and run it supplying a selector procedure that accepts to parameters and returns
; the first one

(define (car z)
  (z (lambda (p q) p)))

; take a procedure and run it supplying a selector procedure that accepts to parameters and returns
; the second one

(define (cdr z)
  (z (lambda (p q) q)))

; substitution:

; (car (cons 1 2))

; (car (lambda (m) (m 1 2)))

; (lambda (m) (m 1 2) (lambda (p q) p))

; 1