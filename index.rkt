#lang scribble/manual

@title{Structure and Interpretation of Computer Programs}

@section{Chapter 1}

@subsection{The Elements of Programming}

@subsubsection{Exercise 1.1}

@(italic "Below is a sequence of expressions. What is the result printed by the interpreter in response to each expression? Assume that the sequence is to be evaluated in the order in which it is presented.")

@codeblock|{
    10                                 ; 10
    (+ 5 3 4)                          ; 12
    (- 9 1)                            ; 8
    (/ 6 2)                            ; 3
    (+ (* 2 4) (- 4 6))                ; 6
    (define a 3)                       ; 3
    (define b (+ a 1))                 ; 4
    (+ a b (* a b))                    ; 19
    (= a b)                            ; #f
    (if (and (> b a) (< b (* a b)))    ; 4
         b
         a)

    (cond ((= a 4) 6)                  ; 16
          ((= b 4) (+ 6 7 a))
          (else 25))
          
    (+ 2 (if (> b a) b a))             ; 6

    (* (cond ((> a b) a)               ; 16
             ((< a b) b)
             (else -1))
       (+ a 1))
}|

@subsubsection{Exercise 1.2}

@(italic "Translate an expression into prefix form (not sure how to typeset the expression yet, so it's missing).")

@codeblock|{
(/ (+ 5
      4
     (- 2 (- 3 (+ 6 (/ 4 5)))))
   (* 3
      (- 6 2)
      (- 2 7)))
}|

@subsubsection{Exercise 1.3}

@(italic "Define a procedure that takes three numbers as arguments and returns the sum of the squares of the two larger numbers.")

@codeblock|{
(define (square-two-largest-nums x y z)
    (if (and (> x z) (> y z))
        (+ (* x x) (* y y))
        (if (and (> y x) (> z x))
            (+ (* y y) (* z z))
            (+ (* x x) (* z z)))))
}|

@subsubsection{Exercise 1.4}

@(italic "Observe that our model of evaluation allows for combinations whose operators are compound expressions. Use this observation to describe the behavior of the following procedure:")

@codeblock|{
(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
}|

If @(italic "b") is greater than @(italic "0"), add @(italic "a") and @(italic "b"). Otherwise, substract @(italic "b") from @(italic "a").

@subsubsection{Exercise 1.5}

@(italic "How does the following code change if it's ran using applicative-order evaluation vs normal-order evaluation?")

@codeblock|{
(define (p) (p))
(define (test x y)
    (if (= x 0) 0 y))

(test 0 (p))
}|

Normal-order evaluation:

@codeblock|{
(test 0 (p))

(if (= 0 0) 0 (p))
(p)
(p)
(p)
...
}|

Normal-order fully expands and then reduces so when it reaches @(italic "(p)") it'll expand an infinitely recusrive function meaning the interpreter will not finish. 

Applicative-order evaluation:

@codeblock|{
(test 0 (p))

(if (= 0 0) 0 (p))
0
}|

Applicative-order only evaluates what is required to run, so it'll see @(italic "(= 0 0)") as @(italic "#t") and return without evaluating the infinite loop. 

@subsubsection{Exercise 1.6}

