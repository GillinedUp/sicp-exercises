#lang sicp

; (define (make-mobile left right)
;   (list left right))

(define (make-mobile left right)
  (cons left right))

; (define (make-branch length structure)
;   (list length structure))

(define (make-branch length structure)
  (cons length structure))

(define (left-branch mobile)
  (car mobile))

; (define (right-branch mobile)
;   (car (cdr mobile)))

(define (right-branch mobile)
  (cdr mobile))

(define (branch-length branch)
  (car branch))

; (define (branch-structure branch)
;   (car (cdr branch)))

(define (branch-structure branch)
  (cdr branch))

(define (total-weight mobile)
  (if (not (pair? mobile)) 
      mobile
      (let 
          ((left-structure (branch-structure (left-branch mobile)))
           (right-structure (branch-structure (right-branch mobile))))
        (+
         (if (pair? left-structure)
             (total-weight left-structure)
             left-structure)
         (if (pair? right-structure)
             (total-weight right-structure)
             right-structure)))))
  
(define (balanced? mobile)
  (if (not (pair? mobile))
      #t
      (let ((left (left-branch mobile))
            (right (right-branch mobile)))
        (let ((left-structure (branch-structure left))
              (right-structure (branch-structure right)))
          (and 
           (balanced? left-structure)
           (balanced? right-structure)
           (= 
            (* 
             (branch-length left) 
             (total-weight left-structure))
            (* 
             (branch-length right) 
             (total-weight right-structure))))))))

(define x 
  (make-mobile
   (make-branch 2
                (make-mobile
                 (make-branch 3 4)
                 (make-branch 4 3)))
   (make-branch 2 
                (make-mobile
                 (make-branch 4 3) 
                 (make-branch 3 4)))))

(balanced? x)
