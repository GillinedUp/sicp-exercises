#lang sicp

(define (cons x y)
  (* (expt 2 x) (expt 3 y)))

(define (iter x base)
  (if (> (remainder x base) 0)
      x
      (iter (/ x base) base)))

(define (car z)
  (log (iter z 3) 2))

(define (cdr z)
  (log (iter z 2) 3))

(car (cons 2 3))
(cdr (cons 2 3))