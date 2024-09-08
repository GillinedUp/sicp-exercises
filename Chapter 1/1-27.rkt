#lang sicp

(define (square a) (* a a))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))        

(define (fermat-linear-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (define (iter a b)
    (if (< a b)
        (and (try-it a)
             (iter (+ a 1) b))
        true))
  (iter 1 n))