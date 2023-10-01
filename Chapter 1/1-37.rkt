#lang sicp

(define (cont-frac n d k)
  (define (cont-frac-rec n d k i)
    (if (= i k)
        0
        (/ (n i) (+ (d i) (cont-frac-rec n d k (+ i 1))))))
  (cont-frac-rec n d k 1))

(define (cont-frac-iter n d k)
  (define (iter n d k result)
    (if (= k 0)
        result
        (iter n d (- k 1) (/ (n k) (+ (d k) result)))))
  (iter n d k 0))

(cont-frac-iter (lambda (i) 1.0) (lambda (i) 1.0) 11.0)