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
    some i
    data.users[input.user].roles[i] == "admin"
}

user_is_granted[permission] {
    some i, j
    role := data.users[input.user].roles[i]
    permission := data.role_permissions[role][j]
}