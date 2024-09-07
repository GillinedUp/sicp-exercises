#lang sicp

(define (square x)
  (* x x))

(define (divides? a b)
  (= (remainder b a) 0))

(define (next x)
    (if (= x 2)
        3
        (+ x 2)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))

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

1009 *** 4
1013 *** 6
1019 *** 6
10007 *** 7
10009 *** 11
10037 *** 10
100003 *** 14
100019 *** 17
100043 *** 25
1000003 *** 46
1000033 *** 47
1000039 *** 47
10000019 *** 104
10000079 *** 97
10000103 *** 98
100000007 *** 361
100000037 *** 327
100000039 *** 324

This improved algorithm starts to run faster that the base one starting at
inputs 10'000'000, but it's not 2 times faster. The reason for that probably
because of the additional procedure call and if expression comparing to the
basic algorithm.

|#