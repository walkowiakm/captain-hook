#lang racket
(define (square x)
  (* x x))

(define (inc x)
  (+ x 1))

(define (f g)
  (g 2))

(define (identity x)
  x)

(define (identity3 x y z)
  x y z)



;;Ćwiczenie 2
(define (compose f g)
  (lambda (x) (f (g x))))

;;Ćwiczenie 3

;;jednoargumentowe
(define (repeated p n)
  (if (= n 0)
      identity
      (lambda (x) (p ((repeated p (- n 1)) x)))
      )
  )

;;trzyargumentowe
(define (repeated3 p n)
  (if (= n 0)
      identity3
      (lambda (x y z) (p x y ((repeated3 p (- n 1)) x y z)))
      )
  )


((repeated inc 1) 3)

;;Ćwiczenie 9
(define (build n d b)
  (/ n (+ d b)))

(define (repeated-build k n d b)
  ((repeated3 build k) n d b ))

(define (repeated-square k n)
  ((repeated square k) n))

;;Testy
((compose square inc) 5)
((compose inc square) 5)
(repeated-build 10 1.0 1.0 1.0)


