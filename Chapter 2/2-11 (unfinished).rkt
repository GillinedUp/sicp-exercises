#lang sicp

; Work in progress

(define (make-interval a b) (cons a b))

(define (lower-bound x) (min (car x) (cdr x)))

(define (upper-bound x) (max (car x) (cdr x)))

(define (width-interval x)
  (/ (- (upper-bound x) (lower-bound x)) 2.0))

(define (print-interval x)
  (newline)
  (display "(")
  (display (lower-bound x))
  (display ",")
  (display (upper-bound x))
  (display ")"))

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

(define (diff-sign? a b)
    (or
     (and (> (a 0)) (< (b 0)))
     (and (< (a 0)) (> (b 0)))))







(define (mul-interval-alt x y)  
  (let ((x1 (lower-bound x))
        (y1 (upper-bound x))
        (x2 (lower-bound y))
        (y2 (upper-bound y)))    
    (cond ((all-points-have-same-sign? x1 x2 y1 y2)
           (make-interval (* x1 x2) (* y1 y2)))
          ((first-interval-lower-bound-negative? x1 x2 y1 y2)
           (make-interval (* x1 y2) (* y1 y2)))
          ((second-interval-lower-bound-negative? x1 x2 y1 y2)
           (make-interval (* x2 y1) (* y1 y2)))
          (
           (make-interval (* x2 y1) (* y1 y2)))
          )))

; all 4 points have positive sign

(let ((inter1 (make-interval 0.01 1))
      (inter2 (make-interval 2 4)))
  (mul-interval inter1 inter2))

(define (all-points-have-same-sign? x1 x2 y1 y2)
  (and
   (not (diff-sign? x1 x2))
   (not (diff-sign? y1 y2))
   (not (diff-sign? x1 y1))))

; all 4 points have the negative sign

(let ((inter1 (make-interval -1 -0.01))
      (inter2 (make-interval -4 -2)))
  (mul-interval inter1 inter2))


; only the first interval's lower bound has a negative sign

(let ((inter1 (make-interval -1 0.01))
      (inter2 (make-interval 2 4)))
  (mul-interval inter1 inter2))

(define (first-interval-lower-bound-negative? x1 x2 y1 y2)
  (and
   (< x1 0)
   (diff-sign? x1 y1)
   (diff-sign? x1 x2)
   (not (diff-sign? x2 y2))))

; only the second interval's lower bound has a negative sign

(let ((inter1 (make-interval 0.01 1))
      (inter2 (make-interval -2 4)))
  (mul-interval inter1 inter2))

(define (second-interval-lower-bound-negative? x1 x2 y1 y2)
  (and
   (< x2 0)
   (diff-sign? x2 y2)
   (diff-sign? x1 x2)
   (not (diff-sign? x1 y1))))

; the first interval is negative

(let ((inter1 (make-interval -1 -0.01))
      (inter2 (make-interval 2 4)))
  (mul-interval inter1 inter2))

(and
            (< x1 0)
            (not (diff-sign? x1 y1))
            (not (diff-sign? x2 y2))
            (diff-sign? x1 x2))

; the second interval is negative

(let ((inter1 (make-interval 0.01 1))
      (inter2 (make-interval -4 -2)))
  (mul-interval inter1 inter2))

; lower bounds are negative

(let ((inter1 (make-interval -0.01 1))
      (inter2 (make-interval -2 4)))
  (mul-interval inter1 inter2))

; first interval's upper bound is positive

(let ((inter1 (make-interval -0.01 1))
      (inter2 (make-interval -4 -2)))
  (mul-interval inter1 inter2))

; second interval's upper bound is positive

(let ((inter1 (make-interval -1 -0.01))
      (inter2 (make-interval -4 2)))
  (mul-interval inter1 inter2))




