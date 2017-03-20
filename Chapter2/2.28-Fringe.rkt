#lang planet neil/sicp
(define (fringe tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (list tree))
        (else (append (fringe (car tree)) (fringe (cdr tree))))))

(display (fringe (list (list 1 2 3) (list 3 4) (list 5 6))))