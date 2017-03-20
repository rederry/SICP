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
;求导函数
(define (deriv g)
  (define dx 0.00001)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))
;牛顿变形
(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))
;牛顿法
(define (newton-method g guess)
  (fixed-point (newton-transform g) guess))
;sqrt
(define (sqrt x)
  (newton-method (lambda (y) (- (* y y) x)) 1.0))
;1.40
(define (cubic a b c)
  (lambda (x) (+ (* x x x) (* a x x) (* b x) c)))
(newton-method (cubic 1 1 1) 1)
