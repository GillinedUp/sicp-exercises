#lang sicp

(define (accumulate-rec combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate-rec combiner null-value term (next a) next b))))

(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))

(define (sum term a next b)
  (accumulate-iter + 0 term a next b))

(define (product term a next b)
  (accumulate-iter * 1 term a next b))

(define (square x) (* x x))

(define (pi-approx n)
  (define (add-2 x) (+ 2 x))
  (define (transform x)
    (/ (square x) (square (- x 1))))
  (* (/ 8.0 (+ n 1)) (product transform 4.0 add-2 n))) 

(define (simpson-integral f a b n)
  (define h (/ (- b a) n))
  (define (add-2h x) (+ x (* 2 h)))
  (* (/ h 3)
     (+ (f a)
        (f b)
        (* 4 (sum f (+ a h) add-2h b))
        (* 2 (sum f (+ a (* 2 h)) add-2h b)))))

(define (reciprocal x) (/ 1 x))

(define e 2.718281828459)

(simpson-integral reciprocal 1.0 e 1000000.0)

(pi-approx 100000)