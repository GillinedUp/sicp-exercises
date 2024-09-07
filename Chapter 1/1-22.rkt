#lang sicp

(define (square x)
  (* x x))

(define (divides? a b)
  (= (remainder b a) 0))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (+ test-divisor 1)))))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (start-prime-test n start-time)
  (if (prime? n)
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

1009 *** 3
1013 *** 2
1019 *** 2
10007 *** 13
10009 *** 11
10037 *** 13
100003 *** 15
100019 *** 17
100043 *** 16
1000003 *** 34
1000033 *** 37
1000037 *** 37
10000019 *** 116
10000079 *** 128
10000103 *** 120
100000007 *** 494
100000037 *** 492
100000039 *** 487

(sqrt 1000) -> 31.62
(sqrt 10000) -> 100
(sqrt 100000) -> 316.22
(sqrt 1000000) -> 1000

Measured runtime of this algorithm againts different inputs starts resembling
it's order of growth (O(sqrt(n)) at inputs of the size of 1'000'000 and larger.

|#