#lang sicp

(define (for-each proc items)
  (if (null? items)
      true
      (let ((_ (proc (car items))))
        (for-each proc (cdr items)))))
          