#lang sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

; abstraction barrier: sequence operations

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length sequence)
  (accumulate (lambda (_ y) (+ 1 y)) 0 sequence))

; map test, should return (1 4 9 16)

(map (lambda (x) (* x x)) (list 1 2 3 4))

; append test, should return (1 2 3 4 5 6)

(append (list 1 2 3) (list 4 5 6))

; length test, should return 5

(length (list 1 2 3 4 5))
