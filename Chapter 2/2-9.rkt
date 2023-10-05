#lang sicp

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (lower-bound y))
                 (- (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

(define (make-interval a b) (cons a b))

(define (lower-bound x) (min (car x) (cdr x)))

(define (upper-bound x) (max (car x) (cdr x)))

(define (width-interval x)
  (/ (- (upper-bound x) (lower-bound x)) 2.0))

(let ((inter1 (make-interval 1 3))
      (inter2 (make-interval 2 4)))
  (let ((inter-sum (add-interval inter1 inter2))
        (width-inter1 (width-interval inter1))
        (width-inter2 (width-interval inter2))
        (inter-mul (mul-interval inter1 inter2)))
    (display width-inter1)
    (newline)
    (display width-inter2)
    (newline)
    (display (width-interval inter-sum))
    (newline)
    (display (width-interval inter-mul))))