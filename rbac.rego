package app.rbac

default allow = false

allow {
    user_is_admin
}

allow {
    some permission
    user_is_granted[permission]

    input.action  == permission.action
    input.table == permission.table
}

user_is_admin {
    data.users[input.user].role == "admin"
}

user_is_granted[permission] {
    some i, j
    role := data.users[input.user].role
    permission := data.role_permissions[role][j]
}