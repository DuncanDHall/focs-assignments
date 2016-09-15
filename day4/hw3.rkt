#lang racket

;;; Student Name: Duncan Hall
;;;
;;; Check one:
;;; [x] I completed this assignment without assistance or external resources.
;;; [ ] I completed this assignment with assistance from ___
;;;     and/or using these external resources: ___

;;;;;;;;;;;
;; 1. assq

;; `assq` is a function that takes a key and an association list.
;;
;; It returns the corresponding key/value pair from the list
;; (*i.e.*, the pair whose key is *eq?* to the one it is given).

;; If the key is not found in the list, `assq` returns `#f`.

(define (my-assq key lst)
  (cond [(null? lst) #f]
        [(eq? (car (first lst)) key) (first lst)]
        [else
          (my-assq key (rest lst))]))

(display (list (cons 1 10) (cons 2 20) (cons 3 30))) (newline)
(display (assq 1 (list (cons 1 10) (cons 2 20) (cons 3 30)))) (newline)
(display (my-assq 1 (list (cons 1 10) (cons 2 20) (cons 3 30)))) (newline)


;;;;;;;;;;;
;; 2. lookup-list

;; Add the ability to look up symbols to your evaluator.
;;
;; Add the `lookup-list` argument to your hw2 evaluator (or ours, from the solution set).
;; `(evaluate 'foo lookup-list)` should return whatever `'foo` is associated with in `lookup-list`.

(define (apply-sym-op op arg1 arg2 lkup)
  ((look-up op lkup) arg1 arg2))

(define (look-up key lkup)
  (cdr (my-assq key lkup)))

(define op-lookup
  (list (cons '+ +)
        (cons '- -)
        (cons '* *)
        (cons '/ /)))

(display (apply-sym-op '+ 4 10 op-lookup))



