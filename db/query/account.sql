-- name: CreateAccount: one
INSERT INTO accounts (
    email, password
) VALUES (
    $1, $2
) RETURNING *;

-- name: GetAccount: one
SELECT * FROM accounts
WHERE uuid = $1;

-- name: UpdatePassword:
UPDATE accounts SET password = $1, updated_at = 'now()' WHERE uuid = $2;

-- name: UpdateStatus:
UPDATE accounts SET status = $1, updated_at = 'now()' WHERE uuid = $2;


