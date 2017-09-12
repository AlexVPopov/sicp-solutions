(define (even? n)
  (= (remainder n 2) 0))

(define (double n)
  (+ n n))

(define (halve n)
  (/ n 2))

(define (* a b)
  (define (iter a b n)
    (cond ((= b 0) n)
          ((even? b) (iter (double a) (halve b) n))
          (else (iter a (- b 1) (+ a n)))))
  (iter a b 0))
