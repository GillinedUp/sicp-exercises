#lang sicp

(define x (list 1 2 3))

(define y (list 4 5 6))

(append x y) ; (1 2 3 4 5 6)

(cons x y) ; ((1 2 3) 4 5 6)

(list x y) ; ((1 2 3) (4 5 6))

; Explanation:
; (list x y) 
; (cons x (cons y nil)) 
; (cons '(1 2 3) (cons '(4 5 6) nil))
; (cons '(1 2 3) '((4 5 6)))
; ((1 2 3) (4 5 6))