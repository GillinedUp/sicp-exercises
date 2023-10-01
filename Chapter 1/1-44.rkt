#lang sicp

(define (smooth f)
  (let ((dx 0.0001))
    (lambda (x)
      (/ (+ (f x) (f (- x dx)) (f (+ x dx))) 3))))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (if (= n 1)
      (lambda (x) (f x))
      (repeated (compose f f) (- n 1))))

(define (square x) (* x x))

((repeated (smooth square) 2.0) 5)  

