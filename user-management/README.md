# User-Management Labs

This lab walks through a user creation workflow inside a safe Podman container.

The script prompts for:
- a new username
- account creation
- password assignment
- verification of the user's account

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


