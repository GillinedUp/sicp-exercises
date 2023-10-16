#lang sicp

(define (reverse items)
  (define (iter list-in list-out)
    (if (null? list-in)
        list-out
        (iter
         (cdr list-in)
         (cons (car list-in) list-out))))
  (iter items nil))

; WIP

(define (reverse-rec items)
  (if (null? (cdr items))
      (list (car items))
      (list (reverse-rec (cdr items)) (car items))))

(define (get items)
  (if (not (pair? (car items)))
      (car items)
      (cons (get (car items)) (cdr items))))

(get (reverse-rec (list 1 4 9 16 25)))