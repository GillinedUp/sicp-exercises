#lang sicp

; WIP

(define (deep-reverse tree)
  (define (iter tree-in tree-out)
    (cond ((null? tree-in)
           tree-out)
          ((
          (iter
           (cdr tree-in)
           (cons (car tree-in) tree-out))))
  (iter tree nil))

(define x (list (list 1 2) (list 3 4)))

(deep-reverse x)