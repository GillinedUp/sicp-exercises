#lang sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (count-leaves t)
  (accumulate (lambda (x y) (+ x y))
              0
              (map (lambda (x)
                     (if (not (pair? x))
                         1
                         (count-leaves x)))
                   t)))

(define y (list (list 1 2 (list (list 3 4) 5)) 6 (list 7 8) 9))

(count-leaves y)