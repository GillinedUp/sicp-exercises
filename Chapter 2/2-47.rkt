#lang sicp

(define (make-vect x y)
  (lambda (selector) (selector x y)))

(define (xcor-vect v)
  (v (lambda (x y) x))) 

(define (ycor-vect v)
  (v (lambda (x y) y))) 

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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; (define (make-frame origin edge1 edge2)
;  (list origin edge1 edge2))

; (define (origin-frame frame)
;  (car frame))

; (define (edge1-frame frame)
;   (cadr frame))

; (define(edge2-frame frame)
;   (caddr frame))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (make-frame origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-frame frame)
  (car frame))

(define (edge1-frame frame)
  (cadr frame))

(define (edge2-frame frame)
  (cddr frame))

(define f1 (make-frame (make-vect 1 2)
                       (make-vect 3 4)
                       (make-vect 5 6)))

(print-vect (origin-frame f1))

(print-vect (edge1-frame f1))

(print-vect (edge2-frame f1))

