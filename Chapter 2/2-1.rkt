#lang sicp

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (make-rat n d)
  (let ((g (gcd n d)))
    (cond ((or (and (> n 0) (> d 0))
               (and (< n 0) (< d 0)))
           (cons (/ n g) (/ d g)))
          (else
           (cons (/ (- n) g) (/ (- d) g))))))

(define (numer x) (car x))

(define (denom x) (cdr x))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(print-rat (make-rat 1 2))
(print-rat (make-rat (- 1) 2))
(print-rat (make-rat 1 (- 2)))
(print-rat (make-rat (- 1) (- 2)))
