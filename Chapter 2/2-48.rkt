#lang sicp

(define (make-vect x y)
  (lambda (selector) (selector x y)))

(define (xcor-vect v)
  (v (lambda (x y) x))) 

(define (ycor-vect v)
  (v (lambda (x y) y)))

(define (print-vect v)
  (display "(")
  (display (xcor-vect v))
  (display ",")
  (display (ycor-vect v))
  (display ")")
  (newline))

(define (make-segment start-vec end-vec)
  (lambda (selector) (selector start-vec end-vec)))

(define (start-segment segment)
  (segment (lambda (start-vec end-vec) start-vec)))

(define (end-segment segment)
  (segment (lambda (start-vec end-vec) end-vec)))

(define s1 (make-segment (make-vect 1 2)
                         (make-vect 3 4)))

(print-vect (start-segment s1))

(print-vect (end-segment s1))