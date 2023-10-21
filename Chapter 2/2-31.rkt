#lang sicp

(define (tree-map op tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (op tree))
        (else (cons (tree-map op (car tree))
                    (tree-map op (cdr tree))))))

(define (square x) (* x x))

(define (square-tree tree) (tree-map square tree))

(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))