(define (mexpt b n)
  (if (= n 0)
      1
      (* b (mexpt b (- n 1)))))
;(mexpt 2 1000)

(define (mexp b n)
  (mexp-iter b n 1))
(define (mexp-iter b counter product)
  (if (= counter 0)
      product
      (mexp-iter b (- counter 1) (* b product))))
;(mexp 2 10)

(define (square x)
  (* x x))
(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((meven? n)(square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))
(define (meven? n)
  (= (remainder n 2) 0))
;(fast-expt 2 1000)

(define (fast-exp b n)
  (fast-exp-iter b n 1))
(define (fast- exp-iter b n a)
  (cond ((= n 0) a)
        ((meven? n)(square (fast-exp-iter b (/ n 2))))
        ()
  