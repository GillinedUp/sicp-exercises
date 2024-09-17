#lang sicp

; (define (cont-frac n d k)
;   (define (rec i)
;     (if (> i k)
;         0
;         (/ (n i)
;            (+ (d i) (rec (+ i 1))))))
;   (rec 1))

(define (cont-frac n d k)
  (define (iter acc i)
    (if (= i 0)
        acc
        (iter (/ (n 1)
                 (+ (d 1) acc))
              (- i 1))))
  (iter 0.0 k))

(/ 1.0 (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 12))

; k = 12 is enough for this golden ratio approximation to be accurate for up to 4 decimal places.