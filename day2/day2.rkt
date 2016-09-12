#lang racket

;; day 2 in class assignment

(define (tree-add1 tree)
  (cond [(null? tree) tree]
        [(list? (first tree)) (cons (tree-add1 (first tree)) (tree-add1 (rest tree)))]
        [(integer? (first tree)) (cons (+ (first tree) 1) (tree-add1 (rest tree)))]))

(display (tree-add1 '(3 (1 4)))) (newline)


(define (my-max lst)
  (cond [(null? (rest lst)) (first lst)]
        [else
          (cond [(> (first lst) (second lst))
                 (my-max (cons (first lst) (list-tail lst 2)))]
                [else
                  (my-max (rest lst))])]))

(define (tree-max-depth tree)
  (cond [(null? tree) 0]
        [(list? (first tree)) (+ 1 (max (tree-max-depth (first tree)) (tree-max-depth (rest tree))))]
        [(integer? (first tree)) (tree-max-depth (rest tree))]))

(display (tree-max-depth '(3 (1 (4 1))) ))

