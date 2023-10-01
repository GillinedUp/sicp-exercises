#lang sicp

(define (tan x)
  (define (iter n d k result)
    (if (= k 0)
        result
        (iter n d (- k 1) (/ (n k) (- (d k) result)))))
  (iter
   (lambda (i) (if (= i 1) x (* x x)))
   (lambda (i) (+ i (- i 1)))
   100
   1))

(tan 5.0)