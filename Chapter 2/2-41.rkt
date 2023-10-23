#lang sicp

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))

(define (enumerate-interval a b)
  (if (> a b)
      nil
      (cons a (enumerate-interval (inc a) b))))

(define (filter predicate sequence)
  (cond ((null? sequence) nil)
        ((predicate (car sequence))
         (cons (car sequence)
               (filter predicate (cdr sequence))))
        (else
         (filter predicate (cdr sequence)))))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (unique-triples n)
  (flatmap
   (lambda (i)
     (flatmap
      (lambda (j)
        (map (lambda (k) (list i j k))
             (enumerate-interval 1 (- j 1))))
      (enumerate-interval 1 (- i 1))))
   (enumerate-interval 1 n)))

(define (s-sum-pairs n s)
  (define (sum-to-s? triple)
    (= s
       (+ (car triple)
          (cadr triple)
          (caddr triple))))
  (filter sum-to-s? (unique-triples n)))

(s-sum-pairs 10 12)