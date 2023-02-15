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
    data.users[2].group == "admin"
}

user_is_granted[permission] {
    some k
    role := data.users[input.user].role
    permission := data.role_permissions[role][k]
}
