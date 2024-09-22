#lang sicp

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (define (iter acc k)
    (if (= k 1)
        acc
        (iter (compose f acc) (- k 1))))
  (iter f n))

(define (smooth f)
  (let ((dx 0.00001))
    (lambda (x)
      (/ (+ (f (- x dx))
            (f x)
            (f (+ x dx)))
         3))))

(define (n-fold-smooth f n)
  ((repeated smooth n) f))
