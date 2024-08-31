#lang sicp

(define (cube x) (* x x x))

(define (p x) (- (* 3 x) (* 4 (cube x))))

(define (sine angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

#| (sine 12.15)
   (p (sine (/ 12.15 3.0)))
   (p (sine 4.05))
   (p (p (sine (/ 4.05 3.0))))
   (p (p (sine 1.3499999999999999)))
   (p (p (p (sine (/ 1.35 3.0)))))
   (p (p (p (sine 0.45))))
   (p (p (p (p (sine (/ 0.45 3))))))
   (p (p (p (p (sine 0.15)))))
   (p (p (p (p (p (sine (/ 0.15 3.0)))))))
   (p (p (p (p (p (sine 0.05))))))
   (p (p (p (p (p 0.05)))))
   (p (p (p (p 0.1495))))
   (p (p (p 0.4351345505)))
   (p (p 0.9758465331678772))
   (p -0.7895631144708228)
-0.39980345741334  |#

; a) The procedure p is applied 5 times.
; b) Growth in space is roughly O(0.4*a), similarly to the number of steps. This is a linear recursive process.