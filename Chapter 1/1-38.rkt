#lang sicp

(define (cont-frac n d k)
  (define (iter n d k result)
    (if (= k 0)
        result
        (iter n d (- k 1) (/ (n k) (+ (d k) result)))))
  (iter n d k 0))

(define (d-e i)
  (cond ((= i 1)
         1)
        ((= i 2)
         2)
        ((= 2 (remainder i 3))
         (* (+ (- (/ i 3) (/ (remainder i 3) 3)) 1) 2))
        (else 1)))

(define (euler-num prec)
  (+ 2 (cont-frac
        (lambda (i) 1.0)
        (lambda (i)
          (cond ((= i 1)
                 1)
                ((= i 2)
                 2)
                ((= 2 (remainder i 3))
                 (* (+ (- (/ i 3) (/ (remainder i 3) 3)) 1) 2))
                (else 1)))
        prec)))

(euler-num 1000)