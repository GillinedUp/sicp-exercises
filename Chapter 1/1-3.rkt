#lang sicp

(define (sum-of-squares a b)
  (+ (* a a) (* b b)))

(define (sum-of-squares-of-largest a b c)
  (if (> a b)
      (if (> b c)
          (sum-of-squares a b)
          (sum-of-squares a c))
      (if (> a c)
          (sum-of-squares b a)
          (sum-of-squares b c))))

(sum-of-squares-of-largest 0 2 -3)