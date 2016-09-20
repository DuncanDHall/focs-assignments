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
        [(list? expr) (cond [(eq? (first expr) 'DEFINE)
                             (my-define (second expr) (my-eval(third expr)))]
                            [(eq? (first expr) 'LAMBDA)
                             (lambda (second expr) (third expr))] ;; I can't get this. I'm sorry. I can't work more tonight...
                            [(list? (first expr))
                             (my-eval (cons (my-eval (first expr))
                                            (rest expr)))]
                            [(procedure? (first expr))
                             (apply (first expr) (first (rest expr)))]
                            [(symbol? (first expr))
                             (let ([binding (assq (first expr) bindings)])
                                (if binding
                                    (let ([val (cdr binding)])
                                    (if (list? val)
                                        (apply (first val)
                                               (my-eval (rest expr)))
                                        (cons val (rest expr))))
                                    (error "Unbound name " (first expr))))]
                            [else
                             (cons (my-eval (first expr))
                                            (my-eval (rest expr)))])]
        [(number? expr) expr]
        [(symbol? expr) (let ([binding (assq expr bindings)])
                          (if binding
                              (let ([val (cdr binding)])
                                (if (list? val)
                                    (first val)
                                    val))
                              (error "Unbound variable " expr)))]))

(define (my-define id val)
  (set! bindings (cons (cons id val) bindings)))

(define bindings
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
        (list 'DEFINE (lambda (id val)
                              (set! bindings (cons (cons id val) 
                                                   bindings))))
        (list 'LAMBDA (lambda (args body) (lambda args body)))))


(interpreter)









;(define (interpreter)
  ;(display "begin interpreter – input NOW plz")(newline)
  ;(repl))

;(define (repl)
  ;(display ">> ")
  ;(display (my-eval (read)))
  ;(newline)
  ;(repl))

;(define (my-eval expr)
  ;(cond [(null? expr) expr]
        ;[(number? expr) expr]
        ;[(assq expr vars) (cdr (assq expr vars))]
        ;[(symbol? expr) (error "Unbound variable: " expr)]
        ;[else
          ;(apply-op (first expr) (eval-list (rest expr)))]))

;(define (eval-list lst)
  ;(cond [(null? lst) lst]
        ;[(list? (first lst)) (cons (my-eval (first lst)) (eval-list (rest lst)))]
        ;[(symbol? (first lst)) (cons [if (assq (first lst) vars)
                                         ;(cdr (assq (first lst) vars))
                                         ;(first lst)]
                                     ;[eval-list (rest lst)])]
        ;[else (cons (my-eval (first lst)) (eval-list (rest lst)))]))

;(define (apply-op op args)
  ;(let ((binding (assq op op-list)))
    ;(if binding
      ;(apply (second binding) args)
      ;(error "Don't know how to " op))))

;(define vars
  ;(list))

;(define )

;(define op-list
  ;(list (list 'ADD +)
        ;(list 'SUB -)
        ;(list 'MUL *)
        ;(list 'DIV /)
 
        ;(list 'GT >)
        ;(list 'LT <)
        ;(list 'GE >=)
        ;(list 'LE <=)

        ;(list 'ANND (lambda (a b) (and a b)))
        ;(list 'ORR (lambda (a b) (or a b)))
        ;(list 'IPH (lambda (i t e) (if i t e)))
        ;(list 'NOTT not)
        ;(list 'EQ =)
        ;(list 'NEQ (lambda (a b) (not (= a b))))
        ;(list 'DEFINE (lambda (id e) 
                              ;(set! vars (cons (cons id (my-eval e)) 
                                               ;vars))))
        ;(list 'LAMBDA (lambda (args body) (lambda args body)))))



;(interpreter)
