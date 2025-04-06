#lang sicp

(define (equal? el1 el2)

  (define (both-symbols? x y)
    (and (not (pair? x))
         (not (pair? y))))

  (define (both-pairs? x y)
    (and (pair? x) (pair? y)))

  (cond ((both-symbols? el1 el2)
         (eq? el1 el2))
        ((both-pairs? el1 el2)
         (and (equal? (car el1) (car el2))
              (equal? (cdr el1) (cdr el2))))
        (else false)))

; tests
; should return true

(equal? '(this is a list) '(this is a list))

; should return false

(equal? '(this is a list) '(this (is a) list))