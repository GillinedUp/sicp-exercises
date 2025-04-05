#lang sicp

(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest ; append the generated subsets with the first element to the ones without
                (map (lambda (subset) 
                       (cons (car s) subset)) ; append the first element to the already generated subsets
                     rest)))))

; test, should return (() (3) (2) (2 3) (1) (1 3) (1 2 3))

(subsets (list 1 2 3))

; This algorithm works in the following way:
; 1. Take all the elements from the set except the first one.
; 2. Generate the subsets for those elements.
; 3. Add new subsets that contain the sets from step 2 and the first element that was left out 
; in step 1. As the base condition we have a set that contains a single empty set. We pick a single 
; element from the original set (car s), append it to all subsets that have been already generated 
; (map (lambda (subset) (cons (car s) subset)) rest), and join this set of subsets with the subsets 
; that doesn't contain this picked element (append rest ...). At each function call, picked elements 
; are pushed to the stack one-by-one and then subsequently considered to generate the next batch of 
; subsets. Here is how the process looks like at particular recursive function calls starting 
; from the most nested:
; (())
; (() (3)) - picked 3
; (() (3) (2) (2 3)) - picked 2
; (() (3) (2) (2 3) (1) (1 3) (1 2 3)) - picked 1
