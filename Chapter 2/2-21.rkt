#lang sicp

(define (square-list items)
  (if (null? items)
      nil
      (let ((x (car items)))
        (cons (* x x) (square-list (cdr items))))))

(define (square-list-map items)
  (map (lambda (x) (* x x)) items))

(square-list (list 1 2 3 4))