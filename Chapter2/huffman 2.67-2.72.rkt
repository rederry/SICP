#lang planet neil/sicp
;树叶API
(define (make-leaf symbol weight) ;一个包含符号leaf,叶中符号,权重的表
  (list 'leaf symbol weight))
(define (leaf? object) ;判断是否为树叶
  (eq? (car object) 'leaf))
(define (symbol-leaf x) (cadr x))
(define (weight-leaf x) (caddr x))

;huffman树API
(define (make-code-tree left right) ;包含左右分支,一个符号集合,一个权重
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight left))))
(define (left-branch tree) (car tree))
(define (right-branch tree) (cadr tree))
(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))
(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (caddr tree)))

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
        nil
        (let ((next-branch (chose-next-branch bits current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
                    (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))
(define (chose-next-branch bits tree)
  (cond ((= (car bits) 0) (left-branch tree))
        ((= (car bits) 1) (right-branch tree))
        (else (error "give a wrong tree"))))

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree (make-leaf 'D 1)
                                   (make-leaf 'C 1)))))
(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(display (decode sample-message sample-tree))
            