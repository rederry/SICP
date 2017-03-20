#lang planet neil/sicp
(define (square x)
  (* x x))
;1.42 compose
(define (compose f g)
  (lambda (x) (f (g x))))
;((compose (lambda (x) (* x x)) inc) 6)

;1.43 reptated
(define (repeated f n)
  (define (iter i result)
    (if (= i n)
        result
        (iter (+ i 1) (compose f result))))
  (iter 1 f))
;((repeated square 2) 5)

;1.44 smooth
(define (smooth f)
  (define dx 0.00001)
  (lambda (x) (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3)))
(define (repeated-smooth f)
  (repeated smooth 5))