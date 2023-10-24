#lang sicp

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt b n)
  (define (fast-expt-iter n b a)
    (cond ((= n 1) (* b a))
          ((even? n)
           (fast-expt-iter (/ n 2) (* b b) a))
          (else
           (fast-expt-iter (- n 1) b (* b a)))))
  (fast-expt-iter n b 1))

(fast-expt 434 3443)