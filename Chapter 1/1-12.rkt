#lang sicp

(define (pascal row col)
  (cond ((or (< row col) (< row 1) (< col 1)) 0)
        ((or (= col 1) (= row col)) 1)
        (else (+
               (pascal (- row 1) (- col 1))
               (pascal (- row 1) col)))))

