#lang sicp

(define (product term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))

(define (product-prim term a next b)
  (if (> a b)
      1
      (* (term a)
         (product-prim term (next a) next b))))

(define (factorial n)
  (define (inc x) (+ x 1))
  (define (identity x) x)
  (product-prim identity 1 inc n))

(define (square x) (* x x))

(define (pi-approx n)
  (define (add-2 x) (+ 2 x))
  (define (transform x)
    (/ (square x) (square (- x 1))))
  (* (/ 8.0 (+ n 1)) (product-prim transform 4.0 add-2 n))) 

(factorial 20)

(pi-approx 100000)