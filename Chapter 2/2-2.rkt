#lang sicp

(define (make-segment a b)
  (cons a b))

(define (start-segment x)
  (car x))

(define (end-segment x)
  (cdr x))

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (midpoint-segment seg)
  (define (avg a b)
    (/ (+ a b) 2.0))
  (let ((start-seg (start-segment seg))
        (end-seg (end-segment seg)))
    (make-point
     (avg (x-point start-seg) (x-point end-seg))
     (avg (y-point start-seg) (y-point end-seg)))))

(print-point
 (midpoint-segment
  (make-segment
   (make-point 2 5)
   (make-point 2 8))))
 