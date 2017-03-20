#lang planet neil/sicp
(define (for-each proc items)
  (define (iter result remainder)
    (if (null? remainder)
        #t
        (iter (proc (car remainder)) (cdr remainder))))
  (iter #t items))

(define (for-each2 proc items)
  (if (not (null? items))
      (begin
        (proc (car items))
        (for-each2 proc (cdr items)))))

(for-each2 (lambda (x) (newline) (display x))
          (list 21 12 432))