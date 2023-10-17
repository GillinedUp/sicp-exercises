#lang sicp

(define (deep-reverse items)
  (cond ((null? items) nil)
        ((not (pair? items)) items)
        (else
         (append
          (deep-reverse (cdr items))
          (list (deep-reverse (car items)))))))

(define x (list (list 1 2) (list 3 4)))

(define y (list (list 1 2 (list 3 4)) 5 6))

(deep-reverse y)