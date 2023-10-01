#lang sicp

; I can't believe I've done it!

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n) (lambda (f) (lambda (x) (f ((n f) x))))) ; ((n f) x) - takes out the value from 'n', 'f' then wraps this as an argument 

;(add-1 zero)
;(add-1 (lambda (f) (lambda (x) x)))
;(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) x)) f) x))))
;(lambda (f) (lambda (x) (f ((lambda (x) x) x))))
;(lambda (f) (lambda (x) (f x)))

(define one (lambda (f) (lambda (x) (f x))))

;(add-1 one)
;(add-1 (lambda (f) (lambda (x) (f x))))
;(lambda (f) (lambda (x) (f (((lambda (f) (lambda (x) (f x))) f) x))))
;(lambda (f) (lambda (x) (f (f x))))

(define two (lambda (f) (lambda (x) (f (f x)))))

;(lambda (f) (lambda (x) (f x))) ; one
;(lambda (f) (lambda (x) (f (f x)))) ; two
;(lambda (f) (lambda (x) (f (f (f x))))) ; three

(define (plus a b)
  (lambda (f) (lambda (x) ((a f) ((b f) x)))))

(define (plus-one x)
  (+ x 1))

((zero plus-one) 0)

((one plus-one) 0)

((two plus-one) 0)

(((plus two two) plus-one) 0)

