#lang sicp

(define (cont-frac n d k)
  (define (iter acc i)
    (if (= i 0)
        acc
        (iter (/ (n i)
                 (+ (d i) acc))
              (- i 1))))
  (iter 0.0 k))

(define e
  (+ 2 (cont-frac
        (lambda (i) 1.0)
        (lambda (i)
          (cond ((= i 1) 1)
                ((= i 2) 2)
                ((= (remainder i 3) 2)
                 (+ (* (- (/ i 3)
                          (/ 2 3))
                       2)
                    2))
                (else 1)))
        8)))