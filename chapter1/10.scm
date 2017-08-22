;(define (A x y)
;  (cond ((= y 0) 0)
;        ((= x 0) (* 2 y))
;        ((= y 1) 2)
;        (else (A (- x 1)
;                 (A x (- y 1))))))

;(A 1 10) ; 1024

;(A 2 4) ; 65536

;(A 3 3) ; 65536

;(define (f n) (A 0 n))

;(define (g n) (A 1 n))

;(define (h n) (A 2 n))

;(define (k n) (* 5 n n))

;; =======================

;(f n) ; 2n

;(A 0 n)

;; -----------------------

;(* 2 n)

;; =======================

;(g n) ; 2^n

;(A 1 n)

;; -----------------------

;; for n = 1

;(A 1 1)

;2 ; 2^1

;; for n = 2

;(A 1 2)

;(A (- 1 1) (A 1 (- 2 1)))

;(A 0 (A 1 1))

;(A 0 2)

;(* 2 2)

;4 ; 2^2

;; for n = 3

;(A 1 3)

;(A (-1 1) (A 1 (- 3 1))

;(A 0 (A 1 2))

;(A 0 4)

;(* 2 4)

;8 ; 2^3

;; =======================

;(h n) ; 2 raised (n - 1) times to the power of 2

;(A 2 n)

;; -----------------------

;; for n = 1

;(A 2 1)

;2

;; for n = 2

;(A 2 2)

;(A 1 (A 2 1))

;(A 1 2)

;4 ; 2 ^ 2

;; for n = 3

;(A 2 3)

;(A 1 (A 1 2))

;(A 1 4)

;(A 0 (A 1 3))

;(A 0 (A 0 (A 1 2)))

;(A 0 (A 0 4))

;(A 0 (* 2 4))

;(A 0 8)

;(* 2 8)

;16 ; 4 ^ 2 ; (2 ^ 2) ^ 2
