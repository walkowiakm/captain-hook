#lang racket

(define (square x) (* x x))

;;Ćwiczenie 6 (iteracyjnie)
(define (cont-frac num den k)
  (define (iter-cont-frac count product)
    (if (= count 0)
        product
        (iter-cont-frac (- count 1)  (/ (num count) (+ (den count) product )))
        )
    )
  (iter-cont-frac k 0.0))

( cont-frac ( lambda ( i ) 1.0) ( lambda ( i ) 1.0) 20 )

;;Ćwiczenie 7 PI
(define (PI-den n)
  6)

(define (PI-num n)
  (square (- (* 2 n) 1)))

(cont-frac PI-num PI-den 100)

;;arctg Ćwiczenie 8
(define (num-atan x)
  (lambda (k)
    (if (= k 1)
        x
        (square (* (- k 1) x))
        )))

(define (den-atan k)
  (- (* 2 k) 1))

(define (atan-cf x k)
  (cont-frac (num-atan x) den-atan k))

(define (check-atan x k)
  (- (atan-cf x k) (atan x)))

(check-atan 5 10)
(check-atan pi 10)
(check-atan 0.5 10)



