#lang sicp

(list 'a 'b 'c) ; (a b c)

(list (list 'george)) ; ((george))

(cdr '((x1 x2) (y1 y2))) ; ((y1 y2))

; Explanation:
; (cdr '((x1 x2) (y1 y2)))
; (cdr (list (list 'x1 'x2) (list 'y1 'y2)))
; (cdr (cons (cons 'x1 (cons 'x2 nil)) (cons (cons 'y1 (cons 'y2 nil)) nil)))
; (cons (cons 'y1 (cons 'y2 nil)) nil)
; Interpreter prints: ((y1 y2))

(cadr '((x1 x2) (y1 y2))) ; (y1 y2)

; Explanation:
; (cadr '((x1 x2) (y1 y2)))
; (cadr (list (list 'x1 'x2) (list 'y1 'y2)))
; (cadr (cons (cons 'x1 (cons 'x2 nil)) (cons (cons 'y1 (cons 'y2 nil)) nil)))
; (car (cdr (cons (cons 'x1 (cons 'x2 nil)) (cons (cons 'y1 (cons 'y2 nil)) nil))))
; (car (cons (cons 'y1 (cons 'y2 nil)) nil))
; (cons 'y1 (cons 'y2 nil))
; Interpreter prints: (y1 y2)

(pair? (car '(a short list))) ; #f

(memq 'red '((red shoes) (blue socks))) ; #f

(memq 'red '(red shoes blue socks)); (red shoes blue socks)
