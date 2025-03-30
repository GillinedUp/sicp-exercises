#lang sicp

; (define (reverse items)
;   (if (null? items)
;       nil
;       (append
;        (reverse (cdr items))
;        (list (car items)))))

(define (reverse items)
  (define (move from-list to-list)
    (if (null? from-list)
        to-list
        (move (cdr from-list)
              (cons (car from-list) to-list))))
  (move items nil))
