#lang sicp

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

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