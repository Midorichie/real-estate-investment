(define-map investors principal (tuple (amount uint)))
(define-data-var total-pool uint u0)

(define-constant ERR_INVALID_AMOUNT (err u100))

(define-public (add-investment (amount uint))
  (begin
    (if (<= amount u0)
        ERR_INVALID_AMOUNT
        (let (
              (sender tx-sender)
              (prev-record (default-to { amount: u0 } (map-get? investors sender)))
              (new-amount (+ (get amount prev-record) amount))
             )
          (begin
            (map-set investors sender { amount: new-amount })
            (var-set total-pool (+ amount (var-get total-pool)))
            (ok true)
          )
        )
    )
  )
)

(define-read-only (get-total-pool)
  (ok (var-get total-pool))
)

(define-read-only (get-contribution (addr principal))
  (match (map-get? investors addr)
    contribution (ok (get amount contribution))
    (ok u0)
  )
)
