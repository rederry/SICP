#lang planet neil/sicp
(define (fixed-point f first-guess)
  (define (close-enough? x y)
    (< (abs (- x y)) 0.00001))
  (define (try guess)
    (let ((next (f guess)))
      (newline)
      (display next)
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

;1.35 golden-ratio
;(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)


;1.36 平均阻尼技术
(fixed-point (lambda (x) (/ (log 1000) (log x))) 1.1)
(fixed-point (lambda (x) (* 0.5 (+ (/ (log 1000) (log x)) x))) 1.1)