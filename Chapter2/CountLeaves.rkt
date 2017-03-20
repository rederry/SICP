#lang planet neil/sicp
(define (count-leaves tree)
  (cond ((null? tree) 0)
        ((not (pair? tree)) 1)
        (else (+ (count-leaves (car tree)) (count-leaves (cdr tree))))))

(define x (list (list 1 2) (list 3 4)))
(display (car x))
(newline)
(display (cdr x))

;(count-leaves x)