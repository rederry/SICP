#lang planet neil/sicp
;2.25
(car (cdr (car (cdr (cdr (list 1 3 (list 5 7) 9))))))
(define z (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7))))))) (cadr (cadr (cadr (cadr (cadr (cadr z))))))
(car (car (list (list 7))))

;2.26
(define x (list 1 2 3))
(define y (list 4 5 6))
(display (append x y))
(display (cons x y))
(display (list x y))
