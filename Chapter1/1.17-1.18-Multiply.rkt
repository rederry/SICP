(define (double x)
  (* x 2))
(define (halve x)
  (/ x 2))
(define (multiply a b)
  (cond ((= b 0) 0)
        ((even? b) (double (multiply a (halve b))))
        ((odd? b) (+ a (multiply a (- b 1))))))

(multiply 218 218)

;improve multiply
(define (multi a b)
  (multi-iter a b 0))
(define (multi-iter a b c)
  (cond ((= b 0) c)
        ((even? b) (multi-iter (double a) (halve b) c))
        ((odd? b) (multi-iter a (- b 1) (+ a c)))))

(multi 218 218)