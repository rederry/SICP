#lang planet neil/sicp
2.54
(define (equal? a b)
  (cond ((and (null? a) (null? b)) true)
        ((or (not (pair? a)) (not (pair? b))) (eq? a b))
        (else (and (equal? (car a) (car b)) (equal? (cdr a) (cdr b))))))

;(equal? '(this is a list) '(this (is a) list))
;(list 'this 'is 'a 'list)

;2.53
;(display (list 'a 'b 'c))
;(display (list (list 'george)))
;(display (cdr '((x1 x2) (y1 y2))))
;(display (cadr '((x1 x2) (y1 y2))))
;(pair? (car '(a short list)))

(define (memq item x)
  (cond ((null? x) false)
        ((eq? item (car x)) x)
        (else (memq item (cdr x)))))

;(display (memq 'red '((red shoes) (bule shoes))))
;(display (memq 'red '(red shoes bule shoes)))