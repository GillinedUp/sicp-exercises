#lang sicp

(define (filtered-accumulate combiner null-value predicate? term a next b)
  (if (> a b)
      null-value
      (combiner
       (if (predicate? a) (term a) null-value)
       (filtered-accumulate combiner null-value predicate? term (next a) next b))))

(define (square a) (* a a))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder (square (expmod base (/ exp 2) m))
                    m))
        (else
         (remainder (* base (expmod base (- exp 1) m))
                    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (prime? n)
  (fast-prime? n 5))

(define (inc x) (+ x 1))

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (identity x) x)

(define (sum-squared-primes a b)
  (filtered-accumulate + 0 prime? square a inc b))

(define (product-co-prime n)
  (define (co-prime? a)
    (= (gcd a n) 1))
  (filtered-accumulate * 1 co-prime? identity 1 inc n)) 

(product-co-prime 9)