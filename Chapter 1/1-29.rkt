#lang sicp

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpsons-integral f a b n)
  (define h
    (/ (- b a) n))
  (define (y k)
    (f (+ a (* k h))))
  (define (term-1 x)
    (* 4 (y x)))
  (define (term-2 x)
    (* 2 (y x)))
  (define (next x)
    (+ x 2))
  (* (/ h 3)
     (+ (y 0)
        (y n)
        (sum term-1 1 next n)
        (sum term-2 2 next n))))
