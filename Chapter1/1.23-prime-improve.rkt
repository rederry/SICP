#lang planet neil/sicp

(define (square x)
  (* x x))

(define (smallest-divisor n)
  (divisor n 2))
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

;;测试时间
(define (time-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-time (- (runtime) start-time) n)))
(define (report-time elapsed-time n)
  (display "***")
  (display elapsed-time))
;;连续奇数
(define (next-odd n)
  (if (odd? n)
      (+ n 2)
      (+ n 1)))
  
(define (continue-for-primes n count)
  (time-prime-test n)
  (cond ((= count 0)
          (newline)
          (display "done"))
        ((prime? n)
          (continue-for-primes (next-odd n) (- count 1)))
        (else
          (continue-for-primes (next-odd n) count))))

(define (search-for-primes n)
    (continue-for-primes n 3))
(search-for-primes 100000000)
