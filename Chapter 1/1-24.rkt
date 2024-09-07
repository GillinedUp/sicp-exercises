#lang sicp

(define (square x)
  (* x x))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (start-prime-test n start-time)
  (define times 5)
  (if (fast-prime? n times)
      (report-prime (- (runtime) start-time))))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (search-for-primes start end)
  (timed-prime-test start)
  (if (< start end)
      (search-for-primes
       (+ start (if (even? start) 1 2))
       end)))

#|

1000003 *** 15
1000033 *** 14
1000037 *** 15
10000019 *** 12
10000079 *** 12
10000103 *** 12
100000007 *** 14
100000037 *** 12
100000039 *** 13
1000000007 *** 23
1000000009 *** 22
1000000033 *** 21

(log 10000000) -> 16.11
(log 1000000000) -> 20.72

With input size growing from 10'000'000 to 1'000'000'000 times, I would expect the runtime to increase
by ~25%, which looks to be close.

|#