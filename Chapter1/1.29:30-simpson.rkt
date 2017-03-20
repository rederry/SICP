#lang racket
;cube func
(define (cube x)
  (* x x x))
;sum func
(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))
;1.30sum
(define (sum2 term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))
;integral-1 func
(define (integral-1 f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum2 f (+ a (/ dx 2.0)) add-dx b)
     dx))
;simpson func
(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (y k)
    (f (+ a (* k h))))
  (define (factor k)
    (cond ((or (= k 0) (= k n)) 1)
          ((odd? k) 4)
          ((even? k) 2)))
  (define (next k)
    (+ k 1))
  (define (term k)
    (* (factor k) (y k)))
  (* (sum2 term 0 next n)
     (/ h 3)))

(integral-1 cube 0 1 0.001)
(simpson cube 0 1 1000)
