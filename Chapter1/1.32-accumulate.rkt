#lang planet neil/sicp
;recursive
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
                (accumulate combiner null-value term (next a) next b))))
;iter
(define (accumulate2 combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))


;sum
(define (sum term a next b)
  (accumulate2 (lambda (x y) (+ x y)) 0 term a next b))
(define (sum-cubes a b)
  (sum (lambda (x) (* x x x)) a (lambda (x) (+ x 1)) b))
(sum-cubes 1 10)

;product
(define (product term a next b)
  (accumulate2 (lambda (x y) (* x y)) 1 term a next b))
(define (factorial n)
  (product (lambda (x) x) 1 inc n))
(factorial 5)