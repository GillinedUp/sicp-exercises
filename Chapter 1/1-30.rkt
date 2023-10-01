#lang sicp

(define (sum term a next b)
  (define (iter a result)
    (if (>= a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))

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