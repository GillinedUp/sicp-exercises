#lang sicp

(define (fold-right op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (fold-right op initial (cdr sequence)))))

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter initial sequence))

(define (reverse-fold-right sequence)
  (fold-right (lambda (x y)
                (if (null? y)
                    (list x)
                    (append y (list x))))
              nil
              sequence))

(define (reverse-fold-left sequence)
  (fold-left (lambda (x y) (cons y x))
             nil
             sequence))

(reverse-fold-right (list 1 2 3))

(reverse-fold-left (list 1 2 3))