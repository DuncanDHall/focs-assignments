#lang racket

;;; Student Name: Duncan Hall [change to your name]
;;;
;;; Check one:
;;; [ ] I completed this assignment without assistance or external resources.
;;; [X] I completed this assignment with assistance from Emily! (discussing
;;;             define) 
;;;     and/or using these external resources: ___

(define (interpreter)
  (display "begin interpreter – input NOW plz")(newline)
  (repl))

(define (repl)
  (display ">> ")
  (display (my-eval (read)))
  (newline)
  (repl))

(define (my-eval expr)
  (cond [(null? expr) expr]
        [(number? expr) expr]
        [(assq expr vars) (cdr (assq expr vars))]
        [(symbol? expr) (error "Unbound variable: " expr)]
        [else
          (apply-op (first expr) (eval-list (rest expr)))]))

(define (eval-list lst)
  (cond [(null? lst) lst]
        [(list? (first lst)) (cons (my-eval (first lst)) (eval-list (rest lst)))]
        [(symbol? (first lst)) (cons [if (assq (first lst) vars)
                                         (cdr (assq (first lst) vars))
                                         (first lst)]
                                     [eval-list (rest lst)])]
        [else (cons (my-eval (first lst)) (eval-list (rest lst)))]))

(define (apply-op op args)
  (let ((binding (assq op op-list)))
    (if binding
      (apply (second binding) args)
      (error "Don't know how to " op))))

(define vars
  (list))

(define op-list
  (list (list 'ADD +)
        (list 'SUB -)
        (list 'MUL *)
        (list 'DIV /)
 
        (list 'GT >)
        (list 'LT <)
        (list 'GE >=)
        (list 'LE <=)

        (list 'ANND (lambda (a b) (and a b)))
        (list 'ORR (lambda (a b) (or a b)))
        (list 'IPH (lambda (i t e) (if i t e)))
        (list 'NOTT not)
        (list 'EQ =)
        (list 'NEQ (lambda (a b) (not (= a b))))
        (list 'DEFINE (lambda (id e) 
                              (set! vars (cons (cons id (my-eval e)) 
                                               vars))))))


;(define (my-define id expr)
  ;(define (id expr)))



(interpreter)
