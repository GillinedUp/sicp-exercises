#lang sicp

; abstraction barrier

(define (perimeter-rectangle r)
  (let ((len-a (length-segment (a-side-rectangle r)))
        (len-b (length-segment (b-side-rectangle r))))
    (* 2 (+ len-a len-b))))

(define (area-rectangle r)
  (let ((len-a (length-segment (a-side-rectangle r)))
        (len-b (length-segment (b-side-rectangle r))))
    (* len-a len-b)))

; abstraction barrier, two-segment representation of rectangle constructor and accessors

; (define (make-rectangle a b)
;   (define (has-common-point-segment? a b)
;     (or (equal-point? (start-segment a)
;                       (start-segment b))
;         (equal-point? (start-segment a)
;                       (end-segment b))
;         (equal-point? (end-segment a)
;                       (start-segment b))
;         (equal-point? (end-segment a)
;                       (end-segment b))))
;   (cond ((not (has-common-point-segment? a b))
;          (error "No common point"))
;         ((not (= (dot-prod-segment a b) 0))
;          (error "Dot product is not 0"))
;         ((= (cros-prod-segment a b) 0)
;          (error "Cross product is 0"))
;         (else
;          (cons a b))))

; (define (a-side-rectangle r)
;   (car r))

; (define (b-side-rectangle r)
;   (cdr r))

; abstraction barrier, origin and diagonal segment representation of rectangle constructor and
; accessors

(define (make-rectangle a b)
  (cond ((not (= (dot-prod-segment a b) 0))
         (error "Dot product is not 0"))
        ((= (cros-prod-segment a b) 0)
         (error "Cross product is 0"))
        (else
         (cond ((equal-point? (start-segment a)
                              (start-segment b))
                (cons (start-segment a)
                      (make-segment (end-segment a)
                                    (end-segment b))))
               ((equal-point? (start-segment a)
                              (end-segment b))
                (cons (start-segment a)
                      (make-segment (end-segment a)
                                    (start-segment b))))
               ((equal-point? (end-segment a)
                              (start-segment b))
                (cons (end-segment a)
                      (make-segment (start-segment a)
                                    (end-segment b))))
               ((equal-point? (end-segment a)
                              (end-segment b))
                (cons (end-segment a)
                      (make-segment (start-segment a)
                                    (start-segment b))))
               (else
                (error "No common point"))))))

(define (a-side-rectangle r)
  (make-segment (car r)
                (start-segment (cdr r))))

(define (b-side-rectangle r)
  (make-segment (car r)
                (end-segment (cdr r))))

; abstraction barrier

(define (midpoint-segment s)
  (define (average a b)
    (/ (+ a b) 2.0))
  (make-point (average (x-point (start-segment s))
                       (x-point (end-segment s)))
              (average (y-point (start-segment s))
                       (y-point (end-segment s)))))

(define (length-segment s)
  (let ((x1 (x-point (start-segment s)))
        (x2 (x-point (end-segment s)))
        (y1 (y-point (start-segment s)))
        (y2 (y-point (end-segment s))))
    (sqrt (+ (expt (- x2 x1) 2)
             (expt (- y2 y1) 2)))))

(define (dot-prod-segment a b)
  (+ (* (x-point (segment-as-vec a))
        (x-point (segment-as-vec b)))
     (* (y-point (segment-as-vec a))
        (y-point (segment-as-vec b)))))

(define (cros-prod-segment a b)
  (- (* (x-point (segment-as-vec a))
        (y-point (segment-as-vec b)))
     (* (y-point (segment-as-vec a))
        (x-point (segment-as-vec b)))))

(define (segment-as-vec s)
  (make-point (- (x-point (end-segment s))
                 (x-point (start-segment s)))
              (- (y-point (end-segment s))
                 (y-point (start-segment s)))))

; abstraction barrier

(define (make-segment start end)
  (cons start end))

(define (start-segment s)
  (car s))

(define (end-segment s)
  (cdr s))

; abstraction barrier

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define (equal-point? a b)
  (and (= (x-point a)
          (x-point b))
       (= (y-point a)
          (y-point b))))

; abstraction barrier

(define (make-point x y)
  (cons x y))

(define (x-point p)
  (car p))

(define (y-point p)
  (cdr p))
