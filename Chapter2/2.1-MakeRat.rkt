#lang planet neil/sicp
(define (make-rat n d)
  (let ((g (gcd n d)))
    (cond ((or (and (> n 0) (> d 0)) (and (< n 0) (> d 0))) (cons (/ n g) (/ d g)))
          ((or (and (< n 0) (< d 0)) (and (> n 0) (< d 0))) (cons (- (/ n g)) (- (/ d g)))))))
(define (numer x) (car x))
(define (denom x) (cdr x))

(define (add-rat x y)
  (make-rat (+ (* (numer x) (denom y))
               (* (numer y) (denom x)))
            (* (denom x) (denom y))))

(define (print-rat x)
  (newline)
  (display (numer x))
  (display "/")
  (display (denom x)))

(define num 1)
(define den -3)
(+ num 1)
(define one-third (make-rat num den))
(print-rat (add-rat one-third one-third))