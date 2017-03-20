#lang planet neil/sicp
;求不动点
(define (fixed-point f first-guess)
  (define (good-enough? x1 x2)
    (< (abs (- x1 x2)) 0.0001))
  (define (try guess)
    (let ((next (f guess)))
      (if (good-enough? next guess)
          next
          (try next))))
  (try first-guess))
;compose
(define (compose f g)
  (lambda (x) (f (g x))))
;reptated
(define (repeated f n)
  (define (iter i result)
    (if (= i n)
        result
        (iter (+ i 1) (compose f result))))
  (iter 1 f))
;平均阻尼
(define (average-damp f)
  (define (average a b)
    (/ (+ a b) 2))
  (lambda (x) (average x (f x))))

(define (sqrt x)
  (fixed-point ((repeated average-damp 2) (lambda (y) (/ x (* y y y y y y y)))) 1.0))

(sqrt 256)