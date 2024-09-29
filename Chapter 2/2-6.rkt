#lang sicp

(define zero
  (lambda (f)
    (lambda (x) x)))

(define one
  (lambda (f)
    (lambda (x)
      (f x))))

(define two
  (lambda (f)
    (lambda (x)
      (f (f x)))))

(define add-1
  (lambda (n)
    (lambda (f)
      (lambda (x)
        (f ((n f) x))))))

(define add
  (lambda (f g)
    (lambda (n)
      (lambda (x)
        ((f n) ((g n) x))))))

; deriving one

; (add-1 zero)

; (add-1 (lambda (g)
;          (lambda (x) x)))

; ((lambda (n)
;    (lambda (f)
;      (lambda (x)
;        (f ((n f) x)))))
;  (lambda (g)
;    (lambda (x) x)))

; (lambda (f)
;   (lambda (x)
;     (f (((lambda (g)
;            (lambda (x) x))
;          f) x))))

; (lambda (f)
;   (lambda (x)
;     (f ((lambda (x) x) x))))

; (lambda (f)
;   (lambda (x)
;     (f x)))

; deriving two

; (add-1 one)

; (add-1 (lambda (g)
;          (lambda (x)
;            (g x))))

; (lambda (n)
;   (lambda (f)
;     (lambda (x)
;       (f ((n f) x))))
;   (lambda (g)
;     (lambda (x)
;       (g x))))

; (lambda (f)
;   (lambda (x)
;     (f (((lambda (g)
;            (lambda (x)
;              (g x)))
;          f) x))))

; (lambda (f)
;   (lambda (x)
;     (f ((lambda (x)
;           (f x))
;         x))))

; (lambda (f)
;   (lambda (x)
;     (f (f x))))

; deriving add on the (add one two) example

; (define add
;   (lambda (f g)
;     (lambda (n)
;       (lambda (x)
;         ((f n) ((g n) x))))))

; (add one two)

; (add (lambda (f)
;        (lambda (x)
;          (f x)))
;      (lambda (f)
;        (lambda (x)
;          (f (f x)))))

; ((lambda (f g)
;    (lambda (n)
;      (lambda (x)
;        ((f n) ((g n) x)))))
;  (lambda (f)
;    (lambda (x)
;      (f x)))
;  (lambda (f)
;    (lambda (x)
;      (f (f x)))))

; (lambda (n)
;   (lambda (x)
;     (((lambda (f)
;         (lambda (x)
;           (f x)))
;       n)
;      (((lambda (f)
;          (lambda (x)
;            (f (f x))))
;        n)
;       x))))

; (lambda (n)
;   (lambda (x)
;     (((lambda (f)
;         (lambda (x)
;           (f x)))
;       n)
;      ((lambda (x)
;         (n (n x)))
;       x))))

; (lambda (n)
;   (lambda (x)
;     (((lambda (f)
;         (lambda (x)
;           (f x)))
;       n)
;      (n (n x)))))

; (lambda (n)
;   (lambda (x)
;     ((lambda (x)
;        (n x))
;      (n (n x)))))

; (lambda (n)
;   (lambda (x)
;     (n (n (n x)))))
