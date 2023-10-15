#lang sicp

(define (reverse items)
  (define (iter list-in list-out)
    (if (null? list-in)
        list-out
        (iter
         (cdr list-in)
         (cons (car list-in) list-out))))
  (iter items nil))

(reverse (list 1 4 9 16 25))