#lang planet neil/sicp
;;recursive
(define (square-list items)
  (if (null? items)
      nil
      (cons (* (car items) (car items)) (square-list (cdr items)))))
;;迭代方法
(define (square-list3 items)
  (define (iter result remainder)
    (if (null? remainder)
        result
        (iter (cons ((lambda (x) (* x x)) (car remainder))  result) (cdr remainder))))
  (iter nil items))
;;map
(define (map proc items)
  (if (null? items)
      nil
      (cons (proc (car items))
            (map proc (cdr items)))))
(define (square-list2 items)
  (map (lambda (x) (* x x)) items))

(square-list3 (list 1 2 3 4))