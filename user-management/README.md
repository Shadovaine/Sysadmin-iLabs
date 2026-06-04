# User-Management Labs

This lab walks through a user creation workflow inside a safe Podman container.

## Features

- Creates a new user
- Sets a password
- Verifies account details
- View the user's home directory
- Ability to Delete or Reset a lab user

## Run the Lab

From the repo root:

```bash
podman build -t sysadmin-ilabs .
podman run -it --rm sysadmin-ilabs
```

## Once inside container:

```bash
./user-management/lab.sh
```


