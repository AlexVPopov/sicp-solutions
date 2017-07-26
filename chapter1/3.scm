(define (square x)
  (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (<= x y)
  (not (> x y)))

(define (smallest x y z)
  (cond ((and (<= x y) (<= x z)) x)
        ((and (<= y x) (<= y z)) y)
        ((and (<= z x) (<= z y)) z)))

(define (sum-of-squares-of-largest-two x y z)
  (cond ((= x (smallest x y z)) (sum-of-squares y z))
        ((= y (smallest x y z)) (sum-of-squares x z))
        ((= z (smallest x y z)) (sum-of-squares x y))))
