#lang sicp

(define (same-parity first-arg . rest-of-args)
  (define (filter args)
    (cond ((null? args)
           nil)
          ((= (remainder (car args) 2)
              (remainder first-arg 2))
           (cons (car args)
                 (filter (cdr args))))
          (else
           (filter (cdr args)))))
  (cons first-arg (filter rest-of-args)))

