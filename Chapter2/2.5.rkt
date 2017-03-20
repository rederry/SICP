#lang planet neil/sicp
(define (cons a b)
  (* (expt 2 a) (expt 3 b)))
(define (car z)
  (if (= (remainder z 2) 0)
      (+ 1 (car (/ z 2)))
      0))
(define (cdr z)
  (if (= (remainder z 3) 0)
      (+ 1 (car (/ z 3)))
      0))

(car (cons 2 3))
(cdr (cons 2 3))