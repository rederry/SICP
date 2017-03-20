(define (mabs x)
  (if (< x 0)
      (- x)
      x))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (msquare x)
  (* x x))

(define (good-enough? guess x)
  (good-engouh-delta? (mabs (- (msquare guess) x)) guess x))

(define (good-engouh-delta? delta guess x)
  (< (mabs (- delta (new-delta guess x))) 0.001))

(define (new-delta guess x)
  (mabs (- (msquare (improve guess x)) x)))
  
(define (improve guess x)
  (/ (+ (/ x guess) guess) 2))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (msqrt x)
  (sqrt-iter 1.0 x))

(msqrt 900000000000000000000000000000000000000000000000000000000000000000000000000000000000)

 ;(if #t (display "good") (display "bad"))
 ;(new-if #t (display "good") (display "bad"))
 ;(cond ((> 1 0) (display "good"))
 ;     ((> 2 1) (display "bad")))