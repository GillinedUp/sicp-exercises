#lang sicp

(#%require sicp-pict)

(define outline-painter
  (let ((outline-segments
         (list (make-segment (make-vect 0.0 0.0)
                             (make-vect 0.0 1.0))
               (make-segment (make-vect 0.0 1.0)
                             (make-vect 1.0 1.0))
               (make-segment (make-vect 1.0 1.0)
                             (make-vect 1.0 0.0))
               (make-segment (make-vect 1.0 0.0)
                             (make-vect 0.0 0.0)))))
    (segments->painter outline-segments)))
                      
(define x-painter
  (let ((x-segments
         (list (make-segment (make-vect 0.0 1.0)
                             (make-vect 1.0 0.0))
               (make-segment (make-vect 0.0 0.0)
                             (make-vect 1.0 1.0)))))
    (segments->painter x-segments)))

(define diamond-painter
  (let ((diamond-segments
         (list (make-segment (make-vect 0.0 0.5)
                             (make-vect 0.5 1.0))
               (make-segment (make-vect 0.5 1.0)
                             (make-vect 1.0 0.5))
               (make-segment (make-vect 1.0 0.5)
                             (make-vect 0.5 0.0))
               (make-segment (make-vect 0.5 0.0)
                             (make-vect 0.0 0.5)))))
    (segments->painter diamond-segments)))

(paint diamond-painter)

; wave pattern looks like to much manual work, so I will call it a day :D

