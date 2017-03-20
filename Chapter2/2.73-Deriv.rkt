#lang planet neil/sicp
;deriv-API
;x是变量吗
(define (variable? x) (symbol? x))
;x1 and x2 are the same?
(define (same-variable? x1 x2)
  (and (variable? x1) (variable? x2) (eq? x1 x2)))
;e是和式吗
(define (sum? e)
  (and (pair? e) (eq? '+ (car e))))
;e的被加数与加数
(define (addend e) (cadr e))
(define (augend e)
  (if (> (length e) 3)
      (append '(+) (cddr e))
      (caddr e)))

;构造和式，乘式
(define (make-sum a1 a2)
  (cond ((=number? a1 0) a2)
        ((=number? a2 0) a1)
        ((and (number? a1) (number? a2)) (+ a1 a2))
        (else (list '+ a1 a2))))
(define (make-product a1 a2)
  (cond ((or (=number? a1 0) (=number? a2 0)) 0)
        ((=number? a1 1) a2)
        ((=number? a2 1) a1)
        ((and (number? a1) (number? a2)) (* a1 a2))
        (else (list '* a1 a2))))
;e是乘式吗
(define (product? e)
  (and (pair? e) (eq? '* (car e))))
;e的被乘数与乘数
(define (multiplier e) (cadr e))
(define (multiplicand e)
  (if (> (length e) 3)
      (append '(*) (cddr e))
      (caddr e)))
;e是指数式吗
(define (exponentiation? e)
  (and (pair? e) (eq? '** (car e))))
;e的底数与指数
(define (base e) (cadr e))
(define (exponent e) (caddr e))
;构造指数式
(define (make-exponentiation base exponent)
  (cond ((=number? exponent 0) 1)
        ((=number? exponent 1) base)
        (else (list '** base exponent))))
(define (=number? exp num)
  (and (number? exp) (= exp num)))

;Deriv 基于类型的显示分派
#|
(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                              (deriv (augend exp) var)))
        ((product? exp)
         (make-sum (make-product (deriv (multiplicand exp) var)
                                        (multiplier exp))
                   (make-product (deriv (multiplier exp) var)
                                        (multiplicand exp))))
        ((exponentiation? exp)
         (let ((base (base exp))
               (exponent (exponent exp)))
           (make-product (deriv base var)
                         (make-product exponent
                                       (make-exponentiation base
                                                            (+ exponent -1))))))
        (else
         (error "unkown expression type -- DERIV" exp))))
|#

;; Unit test
;;(display (deriv '(* x y (+ x 3)) 'x))

;; 数据导向风格
