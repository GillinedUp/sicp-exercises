#lang sicp

; We can rewrite the equation that defines the golden ratio

; phi^2 = phi + 1

; to 

; phi = 1 + 1 / phi

; by dividing both sides of the equation by phi. We can represent this 
; equation as mapping

; x -> 1 + 1 / x

; and a fixed-point function x = f(x), where

; f(x) = 1 + 1 / x

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (display next)
      (newline)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define golden-ratio
  (fixed-point (lambda (x) (+ 1.0 (/ 1.0 x))) 1.5))