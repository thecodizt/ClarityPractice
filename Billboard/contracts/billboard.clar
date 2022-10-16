
;; billboard
;; <add a description here>

;; constants
;;
(define-constant ERR_STX_TRANSFER u0)


;; data maps and vars
;;
(define-data-var billboard-message (string-utf8 500) u"Hello world!")
(define-data-var price uint u10)

;; private functions
;;

;; public functions
;;
(define-public (set-message (message (string-utf8 500)))
  (let
    (
      (cur-price (var-get price))
      (new-price (+ cur-price u10))
    )

    (unwrap! (stx-transfer? new-price tx-sender (as-contract tx-sender)) (err ERR_STX_TRANSFER))

    (var-set billboard-message message)

    (var-set price new-price)

    (ok new-price)
  )
)

;; read-only functions
;;
(define-read-only (get-message)
  (var-get billboard-message)
)

(define-read-only (get-price) 
  (var-get price)
)