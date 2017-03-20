#lang planet neil/sicp
;prime?
(define (divisor n a)
  (cond ((= (remainder n a) 0) a)
        ((> a (sqrt n) n))
        (else (divisor n (+ a 1)))))
(define (prime? n)
  (cond ((= n 1) #f)
        (else (= (divisor n 2) n))))
;;filter
(define (filtered-accumulate combiner null-value term a next b filter)
  (if (> a b)
      null-value
      ;可以判断后再决定是否使用combiner，用let简化代码
      (combiner (if (filter a)
                    (term a)
                     null-value)
                (filtered-accumulate combiner null-value term (next a) next b filter))))

(define (sum-prime a b)
  (filtered-accumulate (lambda (x y) (+ x y)) 0 (lambda (x) x) a inc b prime?))
(sum-prime 1 10)

;用到闭包 closure
(define (product-gcd n)
  (filtered-accumulate * 1 (lambda (x) x) 1 inc n (lambda (x) (= (gcd x n) 1))))
(product-gcd 10)