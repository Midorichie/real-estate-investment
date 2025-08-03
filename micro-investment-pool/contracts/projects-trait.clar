(define-trait projects-trait (
  (get-project (uint) (response (tuple (name (string-ascii 50)) (active bool)) uint))
))
