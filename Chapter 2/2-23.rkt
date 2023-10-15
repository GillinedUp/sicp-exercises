#lang sicp

; WIP

(define (for-each proc items)
  (define (iter proc items side-effect)
    (if (null? items)
        true
        (iter proc (cdr items) (proc (car items)))))
  (iter proc items 0))

(for-each
 (lambda (x) (newline) (display x))
 (list nil))
          