**Step 1: Write commands into commands.sh**

```

cat > commands.sh <<'EOF'
#!/bin/bash

# ==========================================
# Project 5: Secure Linux Server Permissions
# Ubuntu Linux - User-Based Access Control
# ==========================================

set -e

# Step 1: Create Linux groups
getent group developers || sudo groupadd developers
getent group testers || sudo groupadd testers

# Step 2: Create Linux users
id developer1 || sudo useradd -m -s /bin/bash developer1
id tester1 || sudo useradd -m -s /bin/bash tester1

# Step 3: Assign users to groups
sudo usermod -aG developers developer1
sudo usermod -aG testers tester1

# Step 4: Verify users and groups
id developer1
id tester1
getent group developers
getent group testers

# Step 5: Create protected directory
sudo mkdir -p /project-data

# Step 6: Configure directory ownership
sudo chown root:developers /project-data

# Step 7: Configure directory permissions
sudo chmod 770 /project-data

# Step 8: Verify directory permissions
ls -ld /project-data

# Step 9: Test authorized access
sudo -u developer1 touch /project-data/test.txt

# Verify developer access
sudo -u developer1 ls -l /project-data/

# Step 10: Test unauthorized access
if sudo -u tester1 touch /project-data/denied.txt; then
    echo "ERROR: Unauthorized access was allowed!"
    sudo rm -f /project-data/denied.txt
    exit 1
else
    echo "SUCCESS: Unauthorized access was denied."
fi

# Step 11: Verify final directory contents
sudo -u developer1 ls -l /project-data/

echo "Project 5 implementation completed successfully."
EOF

```

**Step 2: Make the file executable**

```
chmod +x commands.sh
```

**Step 3: Verify the file**

```
cat commands.sh
```

**Step 4: Check file size and permissions**

```
ls -l commands.sh
```

You should see a non-empty file.

Expected project structure

```
project-5-linux-permissions/
│
├── README.md
├── commands.sh

