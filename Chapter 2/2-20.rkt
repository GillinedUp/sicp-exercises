#lang sicp

(define (same-parity x . y)
  (define (filter predicate? items)
    (cond ((null? items)
           nil)
          ((predicate? (car items))
           (cons (car items) (filter predicate? (cdr items))))
          (else
           (filter predicate? (cdr items)))))
  (cons x (filter
           (if (odd? x) odd? even?)
           y)))

(same-parity 1 2 3 4 5 6 7)

(same-parity 2 3 4 5 6 7)
                       