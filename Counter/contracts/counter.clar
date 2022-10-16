;; define counter variable
(define-data-var counter int 0)

;; define getter function
(define-read-only (get-count) (ok (var-get counter)))

;; define update function
(define-public (up-count) 
  (begin
    (var-set counter (+ (var-get counter) 1))
    (ok (var-get counter))
  )
)

(define-public (down-count) 
  (begin
    (var-set counter (- (var-get counter) 1))
    (ok (var-get counter))
  )
)