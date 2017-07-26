; The body of the procedure sqrt-iter consists of the invoaction of the
; procedure new-if. The applicative-order evaluation causes that the three
; operands, passed to the procedure new-if, are evaluated. Since one of these
; operands is an invocation of the procedure sqrt-iter, this causes an infinite
; loop. The special form if, on the other hand has the property, that exactly
; one (the then-clause or the else-clause) is evaluated, even with
; applicative-order evaluation.
