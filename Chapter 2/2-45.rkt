#lang sicp

(#%require sicp-pict)

(define (split combine-result combine-smaller)
  (define (rec painter n)
    (if (= n 0)
      painter
      (let ((smaller (rec painter (- n 1))))
        (combine-result painter
                        (combine-smaller smaller smaller)))))
  (lambda (painter n)
    (rec painter n)))

(define right-split (split beside below))

(define up-split (split below beside))

(define (corner-split painter n)
  (if (= n 0)
      painter
      (let ((up (up-split painter (- n 1)))
            (right (right-split painter (- n 1))))
        (let ((top-left (beside up up))
              (bottom-right (below right right))
              (corner (corner-split painter (- n 1))))
          (beside (below painter top-left)
                  (below bottom-right corner))))))

(define (square-of-four tl tr bl br)
  (lambda (painter)
    (let ((top (beside (tl painter) (tr painter)))
          (bottom (beside (bl painter) (br painter))))
      (below bottom top))))

(define (square-limit painter n)
  (let ((combine4 (square-of-four flip-horiz
                                  identity
                                  rotate180
                                  flip-vert)))
    (combine4 (corner-split painter n))))

(paint (square-limit diagonal-shading 6))