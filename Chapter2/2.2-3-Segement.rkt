#lang planet neil/sicp
(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

(define (make-segment s e) (cons s e))
(define (start-segment s) (car s))
(define (end-segment s) (cdr s))

(define (mid-segment s)
  (make-point (* 0.5 (+ (x-point (start-segment s)) (x-point (end-segment s))))
              (* 0.5 (+ (y-point (start-segment s)) (y-point (end-segment s))))))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

(define start-point (make-point 2 0))
(define end-point (make-point -4 0))
(define segment (make-segment start-point end-point))
;(print-point (mid-segment segment))

;2.3-rectangle
(define (make-rect h w) (cons h w))
(define (height r) (car r))
(define (width r) (cdr r))
(define (rect-circum rect)
  (* 2 (+ (height rect) (width rect))))
(define (rect-area rect)
  (* (height rect) (width rect)))

(define (make-rect2 p1 p2)
  (let ((height (abs (- (y-point p1) (y-point p2)))))
    (let ((width (abs (- (y-point p1) (y-point p2)))))
      (cons height width))))

(define (make-rect3 p1 p2) (cons p1 p2))
(define (p1 r) (car r))
(define (p2 r) (cdr r))

(define zero (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(add-1 zero)






