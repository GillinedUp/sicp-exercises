#lang sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

; test, should return (1 4 9 16)

(map (lambda (x) (* x x)) (list 1 2 3 4))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

; test, should return (1 2 3 4 5 6)

(append (list 1 2 3) (list 4 5 6))

(define (length sequence)
  (accumulate (lambda (_ y) (+ 1 y)) 0 sequence))

; test, should return 5

(length (list 1 2 3 4 5))
