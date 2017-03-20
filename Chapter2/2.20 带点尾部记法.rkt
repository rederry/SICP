#lang planet neil/sicp
;(define (same-parity-wrong n . m)
;  (define (iter result remainder)
;    (if (null? remainder)
;         result
;         (iter (cons result (car remainder)) (cdr remainder))))
;  (iter (list ) m))

(define (same? x y)
  (cond ((and (even? x) (even? y)) #t)
        ((and (odd? x) (odd? y)) #t)
        (else #f)))
(define (same-parity n . m)
  (define (sp l)
    (if (null? l)
        nil
        (if (same? (car l) n)
            (cons (car l) (sp (cdr l)))
            (sp (cdr l)))))
  (cons n (sp m)))

(same-parity 1 2 3 4 5 6 7)
            