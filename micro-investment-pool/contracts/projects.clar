(define-map approved-projects uint (tuple (name (string-ascii 50)) (active bool)))
(define-data-var next-project-id uint u1)
(define-data-var admin principal tx-sender)

(define-public (add-project (name (string-ascii 50)))
  (begin
    (if (is-eq tx-sender (var-get admin))
        (let (
              (id (var-get next-project-id))
             )
          (begin
            (map-set approved-projects id { name: name, active: true })
            (var-set next-project-id (+ id u1))
            (ok id)
          )
        )
        (err u100)
    )
  )
)

(define-read-only (get-project (id uint))
  (match (map-get? approved-projects id)
    proj (ok proj)
    (err u101)
  )
)

(define-public (deactivate-project (id uint))
  (begin
    (if (is-eq tx-sender (var-get admin))
        (match (map-get? approved-projects id)
          proj
            (begin
              (map-set approved-projects id { name: (get name proj), active: false })
              (ok true)
            )
          (err u101)
        )
        (err u100)
    )
  )
)
