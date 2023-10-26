#lang sicp

; WIP

(#%require sicp-pict)

(define (flip-horiz painter)
  (transform-painter
   painter
   (make-vect 1.0 0.0)
   (make-vect 0.0 0.0)
   (make-vect 1.0 1.0)))

(paint diagonal-shading)

(paint (flip-horiz diagonal-shading))