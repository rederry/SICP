#lang planet neil/sicp
(define (square-tree tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (* tree tree))
        (else (cons (square-tree (car tree)) (square-tree (cdr tree))))))

(define (s-tree tree)
  (map (lambda (sub-tree)
         (if (pair? sub-tree)
             (s-tree sub-tree)
             (* sub-tree sub-tree)))
       tree))

(define x (list 1 (list 2 (list 3 4))))
(display (square-tree x))(newline)
;(display (s-tree x))

;2.31
(define (tree-map proc tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) (proc tree))
        (else (cons (tree-map proc (car tree)) (tree-map proc (cdr tree))))))

(display (tree-map (lambda (x) (* x x)) x))
