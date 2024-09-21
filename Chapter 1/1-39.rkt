#lang sicp

(define (cont-frac n d k)
  (define (iter acc i)
    (if (= i 0)
        acc
        (iter (/ (n i)
                 (+ (d i) acc))
              (- i 1))))
  (iter 0.0 k))

(define (tan-cf x k)
  (cont-frac (lambda (i)
               (if (= i 1) x (* x x)))
             (lambda (i)
               (if (= i 1) 1 (+ i (- i 1))))
             k))