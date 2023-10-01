#lang sicp

(define (iterative-improve good-enough? improve)
  (define (iter guess)
    (if (good-enough? guess)
        guess
        (iter (improve guess))))
  (lambda (guess) (iter guess)))
 
(define (sqrt x)
  (define guess 2.0)
  (define (average a b)
    (/ (+ a b) 2))
  ((iterative-improve
    (lambda (guess)
      (< (abs (- (expt guess 2) x)) 0.001))
    (lambda (guess)
      (average guess (/ x guess))))
   guess))

(define (fixed-point f first-guess)
  ((iterative-improve
    (lambda (guess)
        (< (abs (- guess (f guess))) 0.001))
    (lambda (guess)
        (f guess)))
   first-guess))

(fixed-point cos 1.0)
(sqrt 16.0)