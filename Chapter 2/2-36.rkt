#lang sicp

(define (accumulate op init seqs)
  (if (null? seqs)
      init
      (op (car seqs)
          (accumulate op init (cdr seqs)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op
                        init
                        (map (lambda (x) (car x))
                             seqs))
            (accumulate-n op
                          init
                          (map (lambda (x) (cdr x))
                               seqs)))))

; test, should return (22 26 30)

(define s
  (list (list 1 2 3)
        (list 4 5 6)
        (list 7 8 9)
        (list 10 11 12)))

(accumulate-n + 0 s)