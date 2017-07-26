; With applicative-order evaluation the interpreter will enter an infinite loop.
; Since the operator and operands a first evaluated, trying the evaluate p will
; cause the infinite loop. In contrast, with normal-order evaluation, p will not
; be evaluated at all, since the if statement will cause only the consequent
; expression to be evaluated and the whole expression will return 0.
