#lang sicp

(define (square x)
  (* x x))

(define (expmod base exp m)

  (define (get-remainder-of-square base exp m)
    (define remainder-of-square
      (remainder (square (expmod base exp m))
                 m))
    (if (or (not (= remainder-of-square 1))
            (not (= remainder-of-square (- m 1))))
        remainder-of-square
        0))

  (cond ((= exp 0) 1)
        ((even? exp)
         (get-remainder-of-square base (/ exp 2) m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (define (iter a b)
    (if (< a b)
        (and (try-it a)
             (iter (+ a 1) b))
        true))
  (iter 1 n))