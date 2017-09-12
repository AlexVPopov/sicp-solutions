;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; helper functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; check if n is an even integer
(define (even? n)
  (= (remainder n 2) 0))

(even? 4) ; #t

(even? 5) ; #f

; exponentiate an integer n to the power of 2
(define (square n)
  (* n n))

(square 2) ; 4

(square 3) ; 9

; multiply an integer n by 2
(define (double n)
  (* n 2))

(double 3) ; 6

(double 4) ; 8

; divide an integer by 2
(define (halve n)
  (/ n 2))

(halve 4) ; 2

(halve 6) ; 3

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; exponentiation of integer b to the power of n
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; recursive
(define (rec-expt b n)
  (if (= n 0)
      1
      (* b (rec-expt b (- n 1)))))

(rec-expt 3 5) ; 243

; iterative
(define (iter-expt b n)
  (define (iter b n a)
    (if (= n 0)
        a
        (iter b (- n 1) (* b a))))
  (iter b n 1))

(iter-expt 3 5) ; 243

; recursive, taking advantage of the fact that b^n = (b^2)^(n/2)
(define (fast-rec-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-rec-expt b (halve n))))
        (else (* b (fast-rec-expt b (- n 1))))))

(fast-rec-expt 3 5) ; 243

; iterative, taking advantage of the fact that b^n = (b^2)^(n/2)
(define (fast-iter-expt b n)
  (define (iter b n a)
    (cond ((= n 0) a)
          ((even? n) (iter (square b) (halve n) a))
          (else (iter b (- n 1) (* a b)))))
  (iter b n 1))

(fast-iter-expt 3 5) ; 243

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; multiplication of integers a and b
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; recursive
(define (rec-mult a b)
  (if (= b 0)
      0
      (+ a (rec-mult a (- b 1)))))

(rec-mult 7 8) ; 56

(rec-mult 123 14) ; 1722

; iterative
(define (iter-mult a b)
  (define (iter a b n)
    (if (= b 0)
        n
        (iter a (- b 1) (+ a n))))
  (iter a b 0))

(iter-mult 7 8) ; 56

(iter-mult 123 14) ; 1722

; recursive, using doubling and halving
(define (fast-rec-mult a b)
  (cond ((= b 0) 0)
        ((even? b) (fast-rec-mult (double a) (halve b)))
        (else (+ a (fast-rec-mult a (- b 1))))))

(fast-rec-mult 7 8) ; 56

(fast-rec-mult 123 14) ; 1722

; iterative, using doubling and halving
(define (fast-iter-mult a b)
  (define (iter a b n)
    (cond ((= b 0) n)
          ((even? b) (iter (double a) (halve b) n))
          (else (iter a (- b 1) (+ a n)))))
  (iter a b 0))

(fast-iter-mult 7 8) ; 56

(fast-iter-mult 123 14) ; 1722
