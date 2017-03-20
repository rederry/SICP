#lang planet neil/sicp
(define (subsets s)
  (if (null? s)
      (list nil)
      (let ((rest (subsets (cdr s))))
        (append rest (map (lambda (x) (append (list 1) x)) rest)))))

(display (subsets (list 1 2 3)))