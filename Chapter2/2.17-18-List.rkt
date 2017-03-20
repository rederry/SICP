#lang planet neil/sicp
(define (length items)
  (if (null? items)
      0
      (+ 1 (length (cdr items)))))
(define (list-ref items n)
  (if (= n 0)
      (car items)
      (list-ref (cdr items) (- n 1))))
(define (append list1 list2)
  (if (null? list1)
      list2
      (cons (car list1) (append (cdr list1) list2))))

;2.17 last-pair
(define (last-pair items)
  (if (null? (cdr items))
      (car items)
      (last-pair (cdr items))))
;(last-pair (list 23 72 149 34))

;2.18 reverse
(define (reverse1 items)
  (define (iter a n)
    (if (< n 0)
        a
        (iter (cons a (list-ref items n)) (- n 1))))
  (iter (last-pair items) (- (length items) 2)))

(define (reverse items)
  (define (iter result remainder)
    (if (null? remainder)
        result
        (iter (cons (car remainder) result) (cdr remainder))))
  (iter (list ) items))
(reverse (list 1 4 9 16 25))



