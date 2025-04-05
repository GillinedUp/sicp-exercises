#lang sicp

(define (accumulate op init seqs)
  (if (null? seqs)
      init
      (op (car seqs)
          (accumulate op init (cdr seqs)))))

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

; abstraction barrier: matrix and vector operations

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (m_row)
         (dot-product m_row v))
       m))

(define (transpose mat)
  (accumulate-n cons nil mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (m_row)
           (matrix-*-vector cols m_row))
         m)))

; tests

(define m (list (list 1 2 3)
                (list 4 5 6)
                (list 7 8 9)))

(define v (list 1 2 3))

; should return (14 32 50)

(matrix-*-vector m v)

; should return ((1 4 7) (2 5 8) (3 6 9))

(transpose m)

; should return ((30 36 42) (66 81 96) (102 126 150))

(matrix-*-matrix m m)