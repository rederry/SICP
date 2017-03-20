#lang planet neil/sicp
;;prime?
(define (square x)(* x x))
(define (smallest-divisor n)(divisor n 2))
(define (divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? n test-divisor) test-divisor)
        (else (divisor n (next test-divisor)))))
(define (divides? a b)
  (=(remainder a b) 0))
(define (next test)
  (if (= test 2) 3 (+ test 2)))
(define (prime? n)
  (= (smallest-divisor n) n))
;accumulate
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence) (accumulate op initial (cdr sequence)))))
;filter
(define (filter predicate seq)
  (cond ((null? seq) nil)
        ((predicate (car seq)) (cons (car seq) (filter predicate (cdr seq))))
        (else (filter predicate (cdr seq)))))
;low-high产生序列
(define (enumerate-interval low high)
  (if (> low high)
      nil
      (cons low (enumerate-interval (+ low 1) high))))
;append累积
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))
;prime
(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair))))
;make-sum
(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair))))
;permutation
(define (permutations s)
  (if (null? s)
      (list nil)
      (flatmap (lambda (x)
                 (map (lambda (p) (cons x p))
                      (permutations (remove x s))))
               s)))
(define (remove item sequence)
  (filter (lambda (x) (not (= x item)))
          sequence))
;(display (permutations (list 1 2 3)))

;;2.40 unique-pairs
(define (unique-pairs n)
  (accumulate append
              nil
              (map (lambda (i)
                     (map (lambda (j) (list i j))
                          (enumerate-interval 1 (- i 1))))
                   (enumerate-interval 1 n))))
(define (prime-sum-pairs n)
  (map make-pair-sum
       (filter prime-sum?
               (unique-pairs n))))
;(display (unique-pairs 6))

;;2.41
(define (improve-unique-pairs n)
  (define (iter n ss)
    (if (= n 0)
        nil
        (append (map (lambda (x) (append x (list n))) ss) (iter (- n 1) ss))))
  (iter n (unique-pairs n)))
(display (improve-unique-pairs 6))
