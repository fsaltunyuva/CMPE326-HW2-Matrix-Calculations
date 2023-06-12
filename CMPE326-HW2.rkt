#lang racket
 
(define M ;Creating a matrix
'(
 (1 2 3)
 (3 3 4)
 (3 2 1)
 )
)

(define (row-max M)
  (define result (make-vector (length M))) ;creating a vector that has the length same as the M's row count

  (do ((i 0 (+ i 1)))
    ((>= i (length M)) result) ;simulating a for loop (for(int i = 0; i < M's row count; i++))
    (let ((max -999999)) ;creating a max variable (created as -9999 to change with first iteration)(it is created in outer loop to do the same process to all rows
      
      (do ((j 0 (+ j 1)))
        ((>= j (length (list-ref M i)))) ;creating inner loop (this also simulates a for loop (for(int j = 0; j < M's column count; j++))
        (when (> (list-ref (list-ref M i) j) max) ;if current value in that row is greater than max
            (set! max (list-ref (list-ref M i) j)) ;change max with that value
            )
        )
      
      (vector-set! result i max))) ;before exiting the outer loop, make the ith element of the result vector "max" value
  )

(row-max M)

(display "\n")

(define (row-avg M)
  (define current-index 0) ;creating a current-index value to specify which index of the "result" vector to append to
  (define result (make-vector (length M))) ;creating a result vector with the length of the row count of M t store the resulting values

    (do ((i 0 (+ i 1)))
      ((>= i (length M)) result) ;simulating a for loop (for(int i = 0; i < M's row count; i++)) (returns "result")
      (let ((sum 0)) ;creating a sum value to hold the summation of the values in the current row
        
        (do ((j 0 (+ j 1)))
          ((>= j (length (list-ref M i)))) ;simulating an inner loop (for(int j = 0; j < M's column count; j++))
          (set! sum (+ sum (list-ref (list-ref M i) j))) ;adding current row's elements to the "sum" value
          )
        
        (let ((avg (/ sum (length (list-ref M i))))) ;creating an "avg" value to store the average of current row (sum/M's row count)
          (vector-set! result current-index (~r avg #:precision 2))) ;adding "avg" value to the "result" vector's "current-index"th value with precision 2 (%.2f)
        (set! current-index (+ current-index 1))) ;before ending the outer loop, increasing "current-index" by one to add the next element to the next index
      )
  )

(row-avg M)

(display "\n")

(define (norm-inf M)
  (let* (
         (max -999999) ;creating a max value with the same reason as row-max (To hold the current max)
         )

    (do ((i 0 (+ i 1)))
      ((>= i (length M))) ;simulating a for loop (for(int i = 0; i < M's row count; i++))
      (let ((sum 0)) ;creating a sum value to find the current summation of that row (It is defined in the outer loop to reset at the beginning of each row
        
        (do ((j 0 (+ j 1)))
          ((>= j (length (list-ref M 0)))) ;simulating an inner for loop (for(int j = 0; j < M's column count; j++)) (M's row column count = First row's length)
          (set! sum (+ sum (abs (list-ref (list-ref M i) j)))) ;adding current row's elements to the "sum" value (Used abs to get absolute value)
          )
        
          (when (> sum max) ;checking if the current sum is greater than the "max" value
            (set! max sum)) ;change the max value with the current "sum" value
        )
      )
    max ;return the max value
    )
  )

(norm-inf M)