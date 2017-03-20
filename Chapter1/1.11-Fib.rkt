(define (foo n)
  (cond ((< n 3) n)
        ((>= n 3) (+ (foo (- n 1))
                       (* 2 (foo (- n 2)))
                       (* 3 (foo (- n 3)))))))

(define (foo2 n)
  (foo2-iter 2 1 0 n))
(define (foo2-iter a b c count)
  (if (< count 3)
      a
      (foo2-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))

(foo 10)
(foo2 10)