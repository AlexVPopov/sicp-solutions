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
; calculating the n-th Fibonacci number
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; recursive
(define (rec-fib n)
  (cond ((= n 0) 0)
        ((= n 1) 1)
        (else (+ (rec-fib (- n 1))
                 (rec-fib (- n 2))))))

(rec-fib 0) ; 0

(rec-fib 1) ; 1

(rec-fib 2) ; 1

(rec-fib 3) ; 2

(rec-fib 4) ; 3

(rec-fib 5) ; 5

(rec-fib 6) ; 8

(rec-fib 7) ; 13

(rec-fib 8) ; 21

(rec-fib 9) ; 34

(rec-fib 10) ; 55

(rec-fib 20) ; 6765

; iterative
(define (iter-fib n)
  (define (iter a b n)
    (if (= n 0)
        b
        (iter (+ a b) a (- n 1))))
  (iter 1 0 n))

(iter-fib 0) ; 0

(iter-fib 1) ; 1

(iter-fib 2) ; 1

(iter-fib 3) ; 2

(iter-fib 4) ; 3

(iter-fib 5) ; 5

(iter-fib 6) ; 8

(iter-fib 7) ; 13

(iter-fib 8) ; 21

(iter-fib 9) ; 34

(iter-fib 10) ; 55

(iter-fib 20) ; 6765

; iterative, with logarithmic growth in time and space

(define (fib n)
  (fib-iter 1 0 0 1 n))
(define (fib-iter a b p q count)
  (cond ((= count 0) b)
        ((even? count)
         (fib-iter a
                   b
                   (+ (square p) (square q))      ; compute p'
                   (+ (* 2 p q) (square q))      ; compute q'
                   (/ count 2)))
        (else (fib-iter (+ (* b q) (* a q) (* a p))
                        (+ (* b p) (* a q))
                        p
                        q
                        (- count 1)))))

(fib 0) ; 0

(fib 1) ; 1

(fib 2) ; 1

(fib 3) ; 2

(fib 4) ; 3

(fib 5) ; 5

(fib 6) ; 8

(fib 7) ; 13

(fib 8) ; 21

(fib 9) ; 34

(fib 10) ; 55

(fib 20) ; 6765

