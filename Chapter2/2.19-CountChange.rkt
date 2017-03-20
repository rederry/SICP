#lang planet neil/sicp
(define (count-change amount)
  (cc1 amount 5))

(define (cc1 amount kinds-of-coins)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (= kinds-of-coins 0)) 0)
        (else
         (+ (cc1 amount (- kinds-of-coins 1))
           (cc1 (- amount (first-denomination1 kinds-of-coins)) kinds-of-coins)))))

(define (first-denomination1 kinds-of-coins)
  (cond ((= kinds-of-coins 1) 1)
        ((= kinds-of-coins 2) 5)
        ((= kinds-of-coins 3) 10)
        ((= kinds-of-coins 4) 25)
        ((= kinds-of-coins 5) 50)))
;;2.19
(define us-coins (list 50 25 10 5 1))
(define us-coins2 (list 1 5 25 50 10))
(define (cc2 amount coin-values)
  (cond ((= amount 0) 1)
        ((or (< amount 0) (no-more? coin-values)) 0)
        (else
         (+ (cc2 amount (except-first-denomination coin-values))
            (cc2 (- amount (first-denomination coin-values)) coin-values)))))

(define (first-denomination coin-values)
  (car coin-values))
(define (except-first-denomination coin-values)
  (cdr coin-values))
(define (no-more? coin-values)
  (null? coin-values))

(cc2 100 us-coins2)