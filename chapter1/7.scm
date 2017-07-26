; For very small numbers, the following implementation of good-enough?
;
;      (define (good-enough? guess x)
;        (< (abs (- (square guess) x)) 0.001))
;
; doesn't work well. For example, given that
; 0.003 * 0.003 = 0.000009, the result of the evaluation (sqrt 0.000009) is
; 0.03134584760656851, which is clearly a wrong answer. The reason is that the
; absolute difference between 0,000982562 (the square of 0.03134584760656851)
; and 0.000009 is less then 0.001, which satisfies the condition, described in
; the current implementation of good-enough? and the improvement of the guess
; stops too early.
;
; For sufficiently large number, the limited floating point precision may cause
; that the improve procedure keeps returning the same value, but the good-enough?
; procedure keeps returning false. For example, when trying to calculate
; sqrt(10000000000000) (13 zeros), at some point the improve procedure keeps
; returning 3162277.6601683795, because in Scheme:
;
;      (/ (+ 3162277.6601683795 (/ 10000000000000 3162277.6601683795)) 2)
;
;      results in
;
;      3162277.6601683795
;
; An implementation of good-enough?, which returns true when the absolute
; difference between the current guess and the next improved one
; (abs (- (improve guess x) guess) is smaller than a very small fraction of the
; original guess (* guess 0.001).

(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess)
     (* guess 0.001)))

; This yields less accurate results for small numbers (for example for 4, the
; first implementation yields 2.0000000929222947, whereas the new one yields
; 2.000609756097561), but provides more accurate results for very small or very
; large numbers.


