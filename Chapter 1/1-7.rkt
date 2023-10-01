#lang sicp

(define (abs x)
    (if (> x 0)
        x
        (- x)))

(define (cube x)
  (* x x x))

(define (cube-root x)
  (define (good-enough? guess)
    (< (abs (- (cube guess) x)) 0.001))
  (define (improve guess)
    (/
     (+ (/ x (* guess guess)) (* 2 guess))
     3))
  (define (cube-root-iter guess)
    (if (good-enough? guess)
        guess
        (cube-root-iter (improve guess))))
  (cube-root-iter 1.0))

(define (check-cube-root x)
  (define (appr-eq expected)
    (< (abs (- x expected)) 0.001))
  (appr-eq (cube-root (cube x))))

(check-cube-root 10)