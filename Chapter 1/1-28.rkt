#lang sicp

(define (square a) (* a a)) 

(define (expmod base exp m)
  (cond ((= exp 0)
         1)
        ((odd? exp)
         (remainder
          (* base (expmod base (- exp 1) m))
          m))
        (else
         (remainder
          (square (expmod base (/ exp 2) m))
          m))))        

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(miller-rabin-test 29)