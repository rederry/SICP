#lang planet neil/sicp
;recursive
(define (cont-frac n d k)
  (define (recursive i)
    (if (> i k)
        (exact->inexact (/ (n i) (d i)))
        (exact->inexact (/ (n i) (+ (d i) (recursive (+ i 1)))))))
  (recursive 1))
;iter
(define (cont-frac2 n d k)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1) (/ (n (- i 1)) (+ (d (- i 1)) result)))))
  (iter k (/ (n k) (d k))))
;1.37
(cont-frac2 (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)

;1,38
;(cont-frac (lambda (i) 1.0)
;           (lambda (i) )

;1.39
(define (tan-cf x k)
  (define (n i) (if (= i 1)
                    x
                    (* x x)))
  (define (d i) i)
  (define (recursive i)
    (if (> i k)
        (/ (n k) (d k))
        (/ (n i) (+ (d i) (recursive (+ i 1))))))
  (recursive 1))
        
        