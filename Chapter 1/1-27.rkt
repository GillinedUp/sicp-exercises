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

(define (fermat-test-iter n a)
  (define (try-it a)
    (= (expmod a n n) a))
  (if (and (< a n) (try-it a))      
      (fermat-test-iter n (+ a 1))
      a))

(define (fermat-test n)
  (fermat-test-iter n 1))

(fermat-test 6603)