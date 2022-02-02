#lang racket

;; slist.replace-inline: Symbol x Symbol x SList -> SList
;; usage: (slist.replace-inline new old slist) = substitute symbol in a symbol list
(define slist.replace-inline
  (lambda (new old slist)
    (if (null? slist)
        '()
        (cons
         (let ([sexp (car slist)])
           (if (not (list? sexp))
               (if (eqv? sexp old)
                   new
                   sexp)
               (slist.replace-inline new old sexp)))
         (slist.replace-inline new old (cdr slist))))))

; s-list ::= ({s-exp}*)
; s-exp  ::= symbol | s-list

; s-list ::= ()
;        ::= (s-exp . s-list)
; s-exp  ::= symbol | s-list

; (.) = cons operator
