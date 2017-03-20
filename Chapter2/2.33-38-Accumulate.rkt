#lang planet neil/sicp
(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))
;2.33
(define (mmap p sequence)
  (accumulate (lambda(x y) (cons (p x) y)) nil sequence))
(define (mappend seq1 seq2)
  (accumulate cons seq2 seq1))
(define (mlength sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))

;2.34
(define (horner-eval x cofficient-sequence)
  (accumulate (lambda (this-coeff higher-terms) (+ this-coeff (* higher-terms x)))
              0
              cofficient-sequence))
;(horner-eval 2 (list 1 3 0 5 0 1))

;2.35
(define (count-leaves t)
  (accumulate + 0 (map (lambda (sub-tree)
                         (if (pair? sub-tree)
                             (count-leaves sub-tree)
                             1))
                       t)))

;2.36
(define (first-objs lst)
  (cond ((null? lst) nil)
        (else (cons (car (car lst)) (first-objs (cdr lst))))))

(define (next-objs lst)
  (cond ((null? lst) nil)
        (else (cons (cdr (car lst)) (next-objs (cdr lst))))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      nil
      (cons (accumulate op init (first-objs seqs))
            (accumulate-n op init (next-objs seqs)))))

(define x (list (list 1 2 3) (list 4 5 6) (list 7 8 9) (list 10 11 12)))
;(display (accumulate-n + 0 x))

;2.37
(define v (list 5 6))
(define w (list 1 2))
(define m (list (list 1 2) (list 3 4)))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))
(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m))
(define (transpose mat)
  (accumulate-n cons nil mat))
;(define (matrix-*-matrix m n)
;  (let ((cols (transpose n)))))

;2.38
(list 2 '())
