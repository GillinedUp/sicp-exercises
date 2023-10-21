#lang sicp

(define (square-tree2 tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (* tree tree))
        (else (cons (square-tree2 (car tree))
                    (square-tree2 (cdr tree))))))

(define (square-tree tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (square-tree sub-tree)
             (* sub-tree sub-tree)))
       tree))

(square-tree2
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))