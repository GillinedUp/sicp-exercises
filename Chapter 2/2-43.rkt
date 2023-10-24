#lang sicp

; I think having this nesting

(flatmap
 (lambda (new-row)
   (map (lambda (rest-of-queens)
          (adjoin-position new-row k rest-of-queens))
        (queen-cols (- k 1))))
 (enumerate-interval 1 board-size))

; instead of this from the exercise 2.42

(flatmap
 (lambda (rest-of-queens)
   (map (lambda (new-row)
          (adjoin-position new-row k rest-of-queens))
        (enumerate-interval 1 board-size)))
 (queen-cols (- k 1)))

; causes the program to run 'queen-cols (-k 1)' for every possible 'new-row', which is 'board-size'.
; So, if the orginal algorithm will take 'T' time to complete, this one will take 'T*board-size'.