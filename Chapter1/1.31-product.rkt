#lang planet neil/sicp
;iter
(define (product2 term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))
;product func
(define (product term a next b)
  (if (> a b)
      1
      (* (term a) (product term (next a) next b))))

;factorial func
(define (factorial n)
  (define (identity x)
    x)
  (define (inc x)
    (+ x 1))
  (product2 identity 1 inc n))
;(factorial 6)

;pi-product func
(define (pi-product n)
  (define (term x)
    (* (exact->inexact (/ (- x 1) x)) (exact->inexact(/ (+ x 1) x))))
  (define (next x)
    (+ x 2))
  (* 4 (product term 3 next n)))

(pi-product 1000000)