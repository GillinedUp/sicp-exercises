#lang sicp

(define (last-pair items)
  (cond ((null? items) nil)
        ((null? (cdr items)) (car items))
        (else (last-pair (cdr items)))))
