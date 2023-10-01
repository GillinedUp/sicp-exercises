#lang sicp

(define (even? n)
  (= (remainder n 2) 0))

(define (double x) (* x 2))

(define (halve x) (/ x 2))

(define (mul a b)
  (cond ((= b 1)   a)
        ((even? b) (double (mul a (halve b))))
        (else      (+ a    (mul a (- b 1))))))

(mul 4342 342)