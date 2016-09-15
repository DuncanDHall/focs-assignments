#lang racket

;; 0. Factorial

(define (factorial n)
  (cond [(= n 1) n]
        [else
          (* n (factorial (- n 1)))]))

(display (factorial 5)) (newline)
(display (factorial 10)) (newline)

(define (fact n)
  (ffact n 1))

(define (ffact n sofar)
  (if (= n 1)
      sofar
      (ffact (- n 1) (* sofar n))))

(display (fact 10)) (newline)


;; 1. Filter

(define (my-filter check lst)
  (ffilter check lst empty))
  

(define (ffilter check? lst sofar)
  (cond [(null? lst) sofar]
        [(check? (first lst)) (ffilter check? (rest lst) (cons (first lst) sofar))]
        [else (ffilter check? (rest lst) sofar)]))

(display (my-filter even? '(1 2 3 4 5 6 7 8))) (newline)


;; 2. Map

(define (my-map func lst)
  (cond [(null? lst) lst]
        [else (cons (func (first lst)) (my-map func (rest lst)))]))

(define (inc n)
  (+ n 1))

(display (my-map inc '(1 2 3 4 5))) (newline)


;; 3. Append

(define (append alst blst)
  
