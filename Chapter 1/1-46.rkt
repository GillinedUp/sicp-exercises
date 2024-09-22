#lang sicp

(define (iterative-improve good-enough? improve)
  (lambda (guess)
    (define (iter current-guess)
      (if (good-enough? current-guess)
          current-guess
          (iter (improve current-guess))))
    (iter guess)))

(define (sqrt x)
  ((iterative-improve
    (lambda (guess)
      (let ((square (lambda (a) (* a a)))
            (tolerance 0.001))
        (< (abs (- (square guess) x)) tolerance)))
    (lambda (guess)
      (let ((average (lambda (a b) (/ (+ a b) 2))))
        (average guess (/ x guess)))))
   1.0))

(define (fixed-point f first-guess)
  ((iterative-improve
    (lambda (guess)
      (let ((tolerance 0.00001))
        (< (abs (- guess (f guess))) tolerance)))
    (lambda (guess)
      (f guess)))
   first-guess))