#lang planet neil/sicp
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((= x (car set)) true)
        (else (element-of-set? x (cdr set)))))

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        ((not (element-of-set? (car set1) set2))
         (cons (car set1) (union-set (cdr set1) set2)))
        (else (union-set (cdr set1) set2))))

(display (union-set (list 13 3 21 4 1) (list 1 2 4 55 3)))