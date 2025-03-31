#lang sicp

; list representation

; (define (make-mobile left right)
;   (list left right))

; (define (make-branch length structure)
;   (list length structure))

; (define (left-branch mobile)
;   (car mobile))

; (define (right-branch mobile)
;   (car (cdr mobile)))

; (define (branch-length branch)
;   (car branch))

; (define (branch-structure branch)
;   (car (cdr branch)))

; cons representation

(define (make-mobile left right)
  (cons left right))

(define (make-branch length structure)
  (cons length structure))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cdr mobile))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cdr branch))

; abstraction barrier - operations on mobiles

(define (total-weight mobile)
  (if (not (pair? mobile))
      mobile
      (let ((left-branch-structure (branch-structure (left-branch mobile)))
            (right-branch-structure (branch-structure (right-branch mobile))))
        (+ (total-weight left-branch-structure)
           (total-weight right-branch-structure)))))

(define (balanced? mobile)
  (define (branch-torque branch)
    (* (branch-length branch)
       (total-weight (branch-structure branch))))
  (define (balanced-mobile? mobile)
    (let ((left-branch-torque (branch-torque (left-branch mobile)))
          (right-branch-torque (branch-torque (right-branch mobile)))
          (left-branch-structure (branch-structure (left-branch mobile)))
          (right-branch-structure (branch-structure (right-branch mobile))))
      (and (= left-branch-torque right-branch-torque)
           (balanced? left-branch-structure)
           (balanced? right-branch-structure))))
  (if (not (pair? mobile))
      true
      (balanced-mobile? mobile)))

; test

(define x
  (make-mobile
   (make-branch
    2
    (make-mobile
     (make-branch 3 4)
     (make-branch 4 3)))
   (make-branch
    2
    (make-mobile
     (make-branch 4 3)
     (make-branch 3 4)))))

; should return 14

(total-weight x)

; should return true

(balanced? x)
