# Project 5: Secure Linux Server Permissions

## Overview

This project demonstrates Linux user-based access control by creating users and groups, configuring directory ownership and permissions, and testing authorized and unauthorized access.

The objective is to secure a Linux directory so that only authorized users can access and modify its contents.

## Objectives

- Create Linux users and groups.
- Assign users to appropriate groups.
- Configure directory ownership using `chown`.
- Apply access restrictions using `chmod`.
- Test authorized and unauthorized file access.
- Verify Linux file and directory permissions.

## Technologies Used

- Ubuntu 24.04 LTS
- Linux
- Bash
- Linux User Management
- Linux Groups
- chmod
- chown
- File Permissions

## Project Architecture

The project uses two groups and two users to demonstrate access control.

| User       | Group      | Access  |
| ---------- | ---------- | ------- |
| developer1 | developers | Allowed |
| tester1    | testers    | Denied  |

A protected directory named `/project-data` is created with the following ownership and permissions:

- Owner: `root`
- Group: `developers`
- Permissions: `770`

Only the root user and members of the developers group can access the directory.

## Implementation Steps

### 1. Create Linux Groups

Create two groups to separate authorized and unauthorized users.

```
sudo groupadd developers
sudo groupadd testers
```

### 2. Create Linux Users

Create two users with their respective home directories.

```
sudo useradd -m -s /bin/bash developer1
sudo useradd -m -s /bin/bash tester1
```

### 3. Assign Users to Groups

Add each user to the appropriate group.

```
sudo usermod -aG developers developer1
sudo usermod -aG testers tester1
```

Verify group membership:

```
id developer1
id tester1
```

### 4. Create a Protected Directory

Create the directory that will contain protected project files.

```
sudo mkdir -p /project-data
```

### 5. Configure Ownership

Set root as the directory owner and developers as its group.

```
sudo chown root:developers /project-data
```

### 6. Configure Directory Permissions

Apply permission `770` to allow full access to the owner and group while denying access to others.

```
sudo chmod 770 /project-data
```

Verify the permissions:

```
ls -ld /project-data
```

Expected output:

```
drwxrwx--- 2 root developers ... /project-data
```

## Understanding Linux Permissions

Linux permissions are divided into three categories:

| Permission  | Numeric Value | Description                    |
| ----------- | ------------- | ------------------------------ |
| Read (r)    | 4             | View directory contents        |
| Write (w)   | 2             | Create or modify files         |
| Execute (x) | 1             | Access or traverse a directory |

The permission `770` means:

- Owner (7): Read, Write, Execute.
- Group (7): Read, Write, Execute.
- Others (0): No permissions.

Therefore, only root and authorized members of the developers group can access `/project-data`.

## Access Testing and Validation

### 1. Test Authorized Access

Run the following command as `developer1` to create a file:

```
sudo -u developer1 touch /project-data/test.txt
```

Verify that the developer can list the directory:

```
sudo -u developer1 ls -l /project-data/
```

Expected result:

```
test.txt
```

**Result:** Developer successfully created and accessed the protected file.

### 2. Test Unauthorized Access

Attempt to create a file as `tester1`:

```
sudo -u tester1 touch /project-data/denied.txt
```

Expected result:

```
Permission denied
```

**Result:** Unauthorized access was successfully blocked by Linux.

## Project Results

The following results were verified during implementation:

| Test Case                            | Expected Result | Status |
| ------------------------------------ | --------------- | ------ |
| Create Linux users and groups        | Successful      | Passed |
| Assign developer to developers group | Successful      | Passed |
| Configure directory ownership        | root:developers | Passed |
| Apply directory permissions          | 770             | Passed |
| Developer file creation              | Allowed         | Passed |
| Developer directory listing          | Allowed         | Passed |
| Tester file creation                 | Denied          | Passed |

## Screenshots

### 1. Linux Users and Groups

Screenshot showing the creation of `developer1`, `tester1`, `developers`, and `testers`.

### 2. Directory Permissions

Screenshot showing the `/project-data` directory ownership and permission configuration.

### 3. Authorized Access Testing

Screenshot showing `developer1` successfully creating and listing `test.txt`.

### 4. Unauthorized Access Testing

Screenshot showing `tester1` receiving a `Permission denied` message.

### 5. GitHub Repository

Screenshot showing the completed project repository and its files.

## Learning Outcomes

Through this project, I learned:

- How to manage Linux users and groups.
- How to configure directory ownership.
- How to apply Linux permissions using `chmod`.
- How to manage file access using `chown`.
- How Linux enforces user-based access restrictions.
- How to test and validate authorized and unauthorized access.

## Conclusion

Successfully implemented user-based access restrictions on an Ubuntu Linux server using Linux users, groups, ownership, and file permissions.

Verified that authorized developers can access protected resources while unauthorized users are denied access.

This project demonstrates fundamental Linux system administration and access control concepts used in server management and cloud environments.

## **2. Your repository structure**

Keep your GitHub repository organized like this:

```
project-5-linux-permissions/
│
├── README.md
├── commands.sh

```


```

**Next step:** Create or update `README.md` with this content, then we'll prepare `commands.sh` and push the complete project to GitHub.
