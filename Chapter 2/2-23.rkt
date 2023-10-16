#lang sicp

(define (for-each proc items)
  (define (iter proc items side-effect)
    (if (null? items)
        true
        (iter proc (cdr items) (proc (car items)))))
  (iter proc items 1))

(for-each
 (lambda (x) (newline) (display x))
 '(57 321 88))
          