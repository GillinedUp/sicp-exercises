#lang sicp

(define (compose f g)
  (lambda (x)
    (f (g x))))

; (define (repeated f n)
;   (if (= n 1)
;       f
;       (compose f (repeated f (- n 1)))))

(define (repeated f n)
  (define (iter acc k)
    (if (= k 1)
        acc
        (iter (compose f acc) (- k 1))))
  (iter f n))