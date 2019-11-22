#lang racket

;; subst: Symbol x Symbol x SList -> SList
;; usage: (subst new old slist) = substitute symbol in a symbol list
(define subst
  (lambda (new old slist)
    (if (null? slist)
        '()
        (cons
         (let ([sexp (car slist)])
           (if (not (list? sexp))
               (if (eqv? sexp old)
                   new
                   sexp)
               (subst new old sexp)))
         (subst new old (cdr slist))))))

; s-list ::= ({s-exp}*)
; s-exp  ::= symbol | s-list

; s-list ::= ()
;        ::= (s-exp . s-list)
; s-exp  ::= symbol | s-list

; (.) = cons operator
