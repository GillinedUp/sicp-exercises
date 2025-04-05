#lang sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves tree)
  (accumulate +
              0
              (map (lambda (sub-tree)
                     (if (not (pair? sub-tree))
                         1
                         (count-leaves sub-tree)))
                   tree)))

; test, should return 9

(count-leaves (list (list 1 2 (list (list 3 4) 5)) 6 (list 7 8) 9))