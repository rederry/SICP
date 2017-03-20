(define (mabs x)
  (if (< x 0)
      (- x)
      x))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (msquare x)
  (* x x))

(define (good-enough? guess new-guess)
  (< (/ (mabs (- guess new-guess))
        guess)
        0.001))
  
(define (improve guess x)
  (/ (+ (/ x guess) guess) 2))

(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (msqrt x)
  (sqrt-iter 1.0 x))

(msqrt 0.00009)
