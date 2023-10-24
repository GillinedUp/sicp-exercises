#lang sicp

(define (make-vect x y)
  (lambda (selector) (selector x y))) ; return a procedure that takes a selector procedure and runs it on x and y

(define (xcor-vect v)
  (v (lambda (x y) x))) ; create a selector given x and y returns x and supply it to the vector procedure

(define (ycor-vect v)
  (v (lambda (x y) y))) ; create a selector given x and y returns y and supply it to the vector procedure

(define (add-vect v1 v2)
  (let ((x1 (xcor-vect v1))
        (y1 (ycor-vect v1))
        (x2 (xcor-vect v2))
        (y2 (ycor-vect v2)))
    (make-vect (+ x1 x2) (+ y1 y2))))

(define (sub-vect v1 v2)
  (let ((x1 (xcor-vect v1))
        (y1 (ycor-vect v1))
        (x2 (xcor-vect v2))
        (y2 (ycor-vect v2)))
    (make-vect (- x1 x2) (- y1 y2))))

(define (scale-vect s v)
  (make-vect (* s (xcor-vect v))
             (* s (ycor-vect v))))

(define (print-vect v)
  (display "(")
  (display (xcor-vect v))
  (display ",")
  (display (ycor-vect v))
  (display ")")
  (newline))

(define v1 (make-vect 1 2))

(define v2 (make-vect 3 4))

(define v3 (add-vect v1 v2))

(print-vect (sub-vect v3 v2))

(print-vect (scale-vect 3 v1))