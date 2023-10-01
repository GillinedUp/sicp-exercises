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

(define (len-segment seg)
  (let ((start-seg (start-segment seg))
        (end-seg (end-segment seg)))
    (let ((x1 (x-point start-seg))
          (x2 (x-point end-seg))
          (y1 (y-point start-seg))
          (y2 (y-point end-seg)))
      (sqrt
       (+
        (expt (- x2 x1) 2)
        (expt (- y2 y1) 2))))))

(define (perimeter-rectangle rectangle first-segment second-segment)
  (let ((len-first-seg (len-segment (first-segment rectangle)))
        (len-second-seg (len-segment (second-segment rectangle))))
    (* (+ len-first-seg len-second-seg) 2.0)))

(define (area-rectangle rectangle first-segment second-segment)
  (let ((len-first-seg (len-segment (first-segment rectangle)))
        (len-second-seg (len-segment (second-segment rectangle))))
    (* len-first-seg len-second-seg)))

(define (make-rectangle p1 p2 p3)
  (cons
   (make-segment p1 p2)
   (make-segment p2 p3)))

(define (first-segment rectangle)
  (car rectangle))

(define (second-segment rectangle)
  (cdr rectangle))

(define (make-rectangle-2 p1 p2 p3)
  (cons p1 (cons p2 p3)))

(define (first-segment-2 rectangle)
  (make-segment
   (car rectangle)
   (car (cdr rectangle))))

(define (second-segment-2 rectangle)
  (make-segment
   (car (cdr rectangle))
   (cdr (cdr rectangle))))

(let ((rectangle (make-rectangle
                  (make-point 0 0)
                  (make-point 0 3)
                  (make-point 3 3))))
  (newline)
  (display (perimeter-rectangle rectangle first-segment second-segment))
  (newline)
  (display (area-rectangle rectangle first-segment second-segment)))

(let ((rectangle (make-rectangle-2
                  (make-point 0 0)
                  (make-point 0 3)
                  (make-point 3 3))))
  (newline)
  (display (perimeter-rectangle rectangle first-segment-2 second-segment-2))
  (newline)
  (display (area-rectangle rectangle first-segment-2 second-segment-2)))

