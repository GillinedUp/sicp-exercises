#lang sicp

(define (f n)
  (if (< n 3)
      n
      (+
       (f (- n 1))
       (* 2 (f (- n 2)))
       (* 3 (f (- n 3))))))

(define (get-a a b c)
  (+ a (* 2 b) (* 3 c)))

(define (f-iter a b c count)
  (if (<= count 0)
      a
      (f-iter (get-a a b c) a b (- count 1))))

(define (f2 n)
  (f-iter 2 1 0 (- n 2)))

(f 32)
(f2 32)