#lang racket
;;pomocnicze funkcje globalne
(define (square x)
  (* x x)
  )

(define (cube x)
  (* x x x)
  )

(define (abs x)
  (if (< x 0)
      (- x)
      x
      )
  )

(define (sgn x)
  (cond
    [(< x 0) (- 1)]
    [(> x 0) 1]
    [else 0]
    )
  )
;;głowna funkcja
(define (cube-root x)
  ;;sprawdzenie poprawności z doladnoscia do 10^(-6)
  (define (is-good? approx) 
    (< (abs (- x approx)) 0.000001)
    )
  ;;poprawienie przybliżenia
  (define (improve approx)
    (/ (+ (/ x (square approx)) approx approx) 3.0)
    )
  ;;petla znajdujaca pierwiastek
  (define (iter approx)
    (if (is-good? (cube approx))
        approx
        (iter (improve approx))
        )
    )
  ;;wywolanie petli
  (iter (sgn x))
 )
;;przykłady testowe
(cube-root 0)
(cube-root 1)
(cube-root 2)
(cube-root 8)
(cube-root 1000000)
(cube-root -2)
(cube-root 0.125)
(cube-root -1/27)