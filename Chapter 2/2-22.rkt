#lang sicp

; The first program produces the answer list in reverse because it uses 'answer' as an accumulator.
; At each iteration the the expression '(cons x answer)' appends accumulator to the end of the new
; accumulator. Since 'x' values are the successive values from the list, they are appended before
; the previous value, thus generating the answer list in reverse. This can be visualized by example
; iteration of the procedure:

; (square-list (list 1 2 3 4))
; (iter '(1 2 3 4) nil)
; (iter '(2 3 4) (cons 1 nil))
; (iter '(2 3 4) '(1))
; (iter '(3 4) (cons 4 '(1)))
; (iter '(3 4) '(4 1))

; ... and so on.

; Reversing 'x' and 'answer' in '(cons answer x)' would not yield the expected result as the output
; structure will not be a properly-nested list. Instead, it will be a two-element list, the first
; element of which would be a two-element list and so on.

; (square-list (list 1 2 3 4))
; (iter '(1 2 3 4) nil)
; (iter '(2 3 4) (cons nil 1))
; (iter '(2 3 4) '(() . 1))
; (iter '(3 4) '((() . 1) . 4))

; ... and so on.

; One way to implement square-list iteratively is to first reverse the parameter list:

(define (square-list items)

  (define (square x) (* x x))

  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))

  (iter (reverse items) nil))



