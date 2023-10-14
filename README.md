# Password Spray Script using Crackmapexec

This Bash script is designed to perform a password spray attack against a list of users using Crackmapexec. The script operates under a specific scenario where, after the fifth failed attempt, the lockout policy is triggered, resulting in the user being locked out. To avoid this, the script skips to the next user after four failed attempts. Modify the script for your own scenario.

## Usage

1. **User and Password Lists:**
   - Ensure you have a file named `thisisuser.txt` containing the list of usernames.
   - Each user should have their password list stored in the `passwords` directory with the same filename as the corresponding username.

2. **Running the Script:**
   - Make sure the script (`script.sh`) has the necessary permissions to execute (`chmod +x script.sh`).
   - Execute the script: `./script.sh`.

## Script Logic

1. The script reads the list of usernames from `thisisuser.txt`.
2. For each user, it extracts their password list, skipping the first four lines (assuming those are headers or irrelevant data).
3. Crackmapexec is then executed for each user, attempting to authenticate with the extracted passwords.
4. If a user's password is incorrect for the fifth consecutive time, the script moves on to the next user, preventing account lockouts.

## Notes

- **Usernames:** Ensure the `thisisuser.txt` file contains the list of usernames you want to target.
- **Password Lists:** Make sure each username in `thisisuser.txt` has a corresponding password file in the `passwords` directory.
- **IP Address:** Modify the target IP address (`192.168.26.160`) in the script to match your target environment.
- **Lockout Policy:** Understand the lockout policy of the target system to avoid accidental lockouts due to excessive login attempts.

**Disclaimer:** This script is intended for educational and ethical purposes only. Misuse of this script for malicious purposes is strictly prohibited.

Feel free to leave a star! Thanks
