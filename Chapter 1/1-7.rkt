#lang sicp

(define (average x y) (/ (+ x y) 2))

(define (improve guess x)
    (average (/ x guess) guess))

(define (sqrt x)
  (define (square x) (* x x))
  (define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))
  (define (sqrt-iter guess x)
    (if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))
  (sqrt-iter 1.0 x))

(define (sqrt-new x)
  (define (good-enough? guess next-guess)
    (< (abs (- guess next-guess)) 0.00001))
  (define (sqrt-iter guess x)
    (define next-guess
      (improve guess x))
    (if (good-enough? guess next-guess)
        guess
        (sqrt-iter next-guess x)))
  (sqrt-iter 1.0 x))

(sqrt 10000000000000)