#lang planet neil/sicp
(define (make-mobile left right)
  (list left right))
(define (make-branch length structure)
  (list length structure))
;;(a)
(define (left-branch mobile)
  (car mobile))
(define (right-branch mobile)
  (cadr mobile))
(define (branch-length branch)
  (car branch))
(define (branch-structure branch)
  (cadr branch))

(define mobile (make-mobile (make-branch 5 (list 1 55)) (make-branch 3 5)))

;;(b)
(define (total-weight mobile)
  (define (tw branch)
    (cond ((null? branch) 0)
          ((not (pair? branch)) branch);weight
          (else (+ (tw (branch-structure branch))))))
  (+ (tw (left-branch mobile)) (tw (right-branch mobile))))
(total-weight mobile)

;;(c)
