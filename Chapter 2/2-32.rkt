#lang sicp

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest ; append generated subsets with the first element to the ones without
                (map (lambda (x) (cons (car s) x)) ; append the first element to already generated subsets
                     rest)))))

(subsets (list 1 2 3))

; To generate the set of all possible subsets:
; 1. Take all the elements from the set except the first one.
; 2. Generate the subsets for those elements.
; 3. Add new subsets that contain the sets from step 2 and the first element that was left out in step 1.
