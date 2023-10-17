#lang sicp

(define (reverse items)
  (define (iter list-in list-out)
    (if (null? list-in)
        list-out
        (iter
         (cdr list-in)
         (cons (car list-in) list-out))))
  (iter items nil))

(define (reverse-rec items)
  (if (null? items)
      nil
      (append
       (reverse-rec (cdr items))
       (list (car items)))))

(reverse-rec (list 1 4 9 16 25))