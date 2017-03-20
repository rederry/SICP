(define (mabs x)
  (if (< x 0)
      (- x)
      x))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (square x)
  (* x x))

(define (good-enough? guess x)
  (< (mabs (- (square guess) x)) 0.001))
  
(define (improve guess x)
  (/ (+ (/ x guess) guess) 2))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (msqrt x)
  (sqrt-iter 1.0 x))

(msqrt 90000)

 ;(if #t (display "good") (display "bad"))
 ;(new-if #t (display "good") (display "bad"))
 ;(cond ((> 1 0) (display "good"))
 ;     ((> 2 1) (display "bad")))