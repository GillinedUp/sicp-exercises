#lang sicp

(define (cons x y)
  (lambda (m) (m x y))) ; take a selector function and apply it to both arguments

(define (car z)
  (z (lambda (p q) p))) ; return a fuction that returns the first element and pass it as a selector fuction

(define (cdr z)
  (z (lambda (p q) q))) ; return a fuction that returns the second element and pass it as a selector fuction

;(car (cons 1 2))
;(car (lambda (m) (m 1 2)))
;((lambda (m) (m 1 2)) (lambda (p q) p)) ; we specify what function (second lambda) is passed as a selector function to apply it (first lambda)
((lambda (p q) p) 1 2)

;(cdr (cons 1 2))
;(cdr (lambda (m) (m 1 2)))
;((lambda (m) (m 1 2)) (lambda (p q) q)) ; we specify what function (second lambda) is passed as a selector function to apply it (first lambda)
((lambda (p q) q) 1 2)