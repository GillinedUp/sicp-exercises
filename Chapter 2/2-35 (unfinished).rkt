#lang sicp

; WIP

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate (lambda (x y) (+ 1 y))
              0
              (map (lambda (x)
                     (if (not (pair? x))
                         x
                         (count-leaves x)))
                   t)))

(define y (list (list 1 2 (list 3 4)) 5 6))

(count-leaves y)