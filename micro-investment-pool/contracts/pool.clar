(define-map investors principal (tuple (amount uint)))
(define-data-var total-pool uint u0)
(define-data-var contract-owner principal tx-sender)
;; Direct contract reference
(define-constant projects-contract .projects)
(define-constant ERR_INVALID_AMOUNT (err u100))
(define-constant ERR_TRANSFER_FAILED (err u101))
(define-constant ERR_PROJECT_NOT_FOUND (err u102))
(define-constant ERR_PROJECT_INACTIVE (err u103))
(define-constant ERR_UNAUTHORIZED (err u104))

;; Accept STX into the pool from tx-sender
(define-public (add-investment (amount uint))
  (begin
    (if (<= amount u0)
        ERR_INVALID_AMOUNT
        (let (
              (sender tx-sender)
              (recipient (as-contract tx-sender))
             )
          (match (stx-transfer? amount sender recipient)
            transfer-ok
              (let (
                    (prev (default-to { amount: u0 } (map-get? investors sender)))
                    (new-amt (+ amount (get amount prev)))
                   )
                (begin
                  (map-set investors sender { amount: new-amt })
                  (var-set total-pool (+ amount (var-get total-pool)))
                  (ok true)
                )
              )
            transfer-err ERR_TRANSFER_FAILED
          )
        )
    )
  )
)

;; Admin-only: release funds to an approved project
(define-public (release-to-project (id uint) (amount uint) (recipient principal))
  (begin
    (if (is-eq tx-sender (var-get contract-owner))
        (begin
          (match (contract-call? .projects get-project id)
            project-data
              (if (get active project-data)
                  (match (stx-transfer? amount (as-contract tx-sender) recipient)
                    success
                      (begin
                        (var-set total-pool (- (var-get total-pool) amount))
                        (ok true)
                      )
                    fail ERR_TRANSFER_FAILED
                  )
                  ERR_PROJECT_INACTIVE
              )
            error ERR_PROJECT_NOT_FOUND
          )
        )
        ERR_UNAUTHORIZED
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
