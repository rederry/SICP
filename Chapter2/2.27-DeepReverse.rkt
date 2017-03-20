#lang planet neil/sicp
;;;reverse
(define (reverse-r lst)
  (if (null? lst)
      nil
      (append (reverse-r (cdr lst)) (list (car lst)))))

(define (reverse items)
  (define (iter result remainder)
    (if (null? remainder)
        result
        (iter (cons (car remainder) result) (cdr remainder))))
  (iter (list ) items))

;;;deep-reverse
(define (deep-reverse22 tree)
  (cond ((null? tree) '())
        ((not (pair? tree)) tree)
        (else (reverse (list (deep-reverse22 (car tree)) (deep-reverse22 (cadr tree)))))))
 
(define (deep-reverse1 items)
  (cond
    ((null? items) nil)
    ((not (pair? items)) items)
    (else 
      (append (deep-reverse1 (cdr items))
              (list (deep-reverse1 (car items)))))))

;;final-solution
(define (deep-reverse tree)
  (cond ((null? tree) nil)
        ((not (pair? tree)) tree)
        (else (list (deep-reverse (cadr tree)) (deep-reverse (car tree))))))

(define x (list (list 1 2) (list 3 4) (list 5 6)))
(display (deep-reverse1 x))