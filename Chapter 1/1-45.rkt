#lang sicp

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (repeated f n)
  (define (iter acc k)
    (if (= k 1)
        acc
        (iter (compose f acc) (- k 1))))
  (iter f n))

(define (average a b)
  (/ (+ a b) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (let ((tolerance 0.0001))
      (< (abs (- v1 v2)) tolerance)))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (n-root x n)
  (let ((damp-num (floor (log n 2))))
    (fixed-point ((repeated average-damp damp-num)
                  (lambda (y)
                    (/ x (expt y (- n 1)))))
                 1.0)))

; To compute n-th root of a number, you need to take (floor (log n 2)) average-damps.
