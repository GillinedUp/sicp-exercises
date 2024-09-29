#lang sicp

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (div-iter div base n)
  (if (not (= (remainder div base) 0))
      n
      (div-iter (/ div base) base (+ n 1))))

(define (car x)
  (div-iter x 2 0))

(define (cdr x)
  (div-iter x 3 0))