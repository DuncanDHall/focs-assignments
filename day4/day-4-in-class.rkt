#lang racket

;; 1.

(define (list-length xs)
  (llist-length xs 0))

(define (llist-length xs so-far)
  (cond [(null? xs) so-far]
        [else
          (llist-length (rest xs) (+ 1 so-far))]))

(display (list-length '())) (newline)
(display (list-length '(a))) (newline)
(display (list-length '(a b))) (newline)
(display (list-length '(a b a b))) (newline)(newline)

;; 2.

(define (count-evens xs)
  (list-length (filter even? xs)))

(display (count-evens '())) (newline)
(display (count-evens '(1))) (newline)
(display (count-evens '(1 2 3))) (newline)
(display (count-evens '(1 4 9 10 12))) (newline)(newline)

;; 3.

(define (list-square xs)
  (map square xs))

(define (square x)
  (* x x))

(display (list-square '(1 2 3))) (newline)(newline)

;; 4

(define (list-add1 xs)
  (map (lambda (x) (+ x 1)) xs))

(display (list-add1 '(1 2 3))) (newline)(newline)

;; 5

(define (list-add10 xs)
  (map (lambda (x) (+ x 10)) xs))

(display (list-add10 '(1 2 3))) (newline)(newline)

;; 6

(define (list-addn n lst)
  (map (lambda (x) (+ x n)) lst))

(display (list-addn 10 '(1 2 3))) (newline) (newline)

;; 7

(define (filter-even xs)
  (filter even? xs))

(display (filter-even '(1 2 3 5 8 13 21 24))) (newline)(newline)

;; 8

(define (filter-positive lst)
  (filter (lambda (x) (> x 0)) lst))

(display (filter-positive '(1 2 -3 -4 5 -6 7))) (newline)(newline)

;; 9

(define (filter-gt lower lst)
  (filter (lambda (x) (>= x lower)) lst))

(display (filter-gt 3 '(1 2 -3 -4 5 -6 7))) (newline)(newline)

;; 11

(define TRUE #t)
(define FALSE #f)
(define (AND ex1 ex2)
  (if (not ex1)
      (FALSE)
      (ex2)))

(define (OR ex1 ex2)
  (if (ex1)
      (TRUE)
      (ex2)))

(define (IF iif then eelse)
  (cond [(iff) then]
        [else eelse]))
