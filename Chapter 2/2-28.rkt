#lang sicp

(define (fringe items)
  (cond 
    ((null? items) nil) 
    ((not (pair? items)) items)
    (else 
      ((if (pair? (car items)) 
        append 
        cons)
          (fringe (car items))
          (fringe (cdr items))))))

(define y (list (list 1 2 (list 3 4)) 5 6))

(fringe y)