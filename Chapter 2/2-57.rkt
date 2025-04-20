#lang sicp

(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (member? el items)
  (cond ((null? items) false)
        ((eq? (car items) el) true)
        (else (member? el (cdr items)))))

; abstraction barrier: constructors and selectors for algebraic expressions

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

; sum handling procedures

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (make-sum a1 a2)
  (cond ((=number? a1 0)
         a2)
        ((=number? a2 0)
         a1)
        ((and (number? a1) (number? a2))
         (+ a1 a2))
        ((and (pair? a2) (eq? (car a2) '+))
         (append (list '+ a1) (cdr a2)))
        (else (list '+ a1 a2))))

(define (addend s) (cadr s))

(define (augend s)
  (define (part-of-sum? exp)
    (and (pair? exp)
         (symbol? (car exp))
         (not (member? (car exp) '(+ * **)))))
  (let ((second-exp (cddr s)))
    (if (part-of-sum? second-exp) ; second-exp is the part of the longer sum, e.g. (y 3) in (+ x y 3)
        (cons '+ second-exp) ; add plus so that we get (+ y 3)
        (car second-exp)))) ; otherwise its either a number, symbol or another operation represented as a list, e.g. (+ x 3) or (+ x y) or (+ x (* y 3))

; product handling procedures

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (make-product m1 m2)
  (cond ((or (=number? m1 0) (=number? m2 0)) 0)
        ((=number? m1 1) m2)
        ((=number? m2 1) m1)
        ((and (number? m1) (number? m2)) (* m1 m2))
        (else (list '* m1 m2))))

(define (multiplier p) (cadr p))

(define (multiplicand p) (caddr p))

; exponentiation handling procedures

(define (exponentiation? x)
  (and (pair? x) (eq? (car x) '**)))

(define (make-exponentiation b e)
  (cond ((=number? e 0) 1)
        ((=number? e 1) b)
        ((and (number? b) (number? e)) (expt b e))
        (else (list '** b e))))

(define (base e) (cadr e))

(define (exponent e) (caddr e))

; abstraction barrier: derivative of an agebraic expression

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        ((exponentiation? exp)
         (make-product
          (make-product (exponent exp)
                        (make-exponentiation (base exp)
                                             (- (exponent exp) 1)))
          (deriv (base exp) var)))
        (else
         (error "unknown expression type -- DERIV" exp))))

; tests

; should print (* 5 (** x 4))
; TODO: uncomment later
; (deriv '(** x 5) 'x)

; should print (* (* 2 (+ (* 3 x) 1)) 3)
; TODO: uncomment later
; (deriv '(** (+ (* 3 x) 1) 2) 'x)

; should print 4

(deriv '(+ x y (* x 3)) 'x)
