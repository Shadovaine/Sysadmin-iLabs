# User-Management Lab

This lab walks a user through user creation workflow inside a safe containized environment.

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


