#lang sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op
                        init
                        (map (lambda (x) (car x))
                             seqs))
            (accumulate-n op
                          init
                          (map (lambda (x) (cdr x))
                               seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product v row)) m))

(define (transpose mat)
  (accumulate-n (lambda (x y) (cons x y))
                nil
                mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row) (matrix-*-vector cols row)) m)))

(define v1 (list 1 2 3))

(define v2 (list 4 5 6))

(dot-product v1 v2)

(define m1 (list (list 1 2 3)
                 (list 4 5 6)
                 (list 7 8 9)))

(matrix-*-vector m1 v2)

(transpose m1)

(matrix-*-matrix m1 (transpose m1))