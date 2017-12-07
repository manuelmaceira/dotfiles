import subprocess

def mailpasswd(account):
    path = "/home/micah/.mail-%s-passwd.gpg" % account
    return subprocess.check_output(["gpg2", "--quiet", "--yes", "--batch", "-d", path]).strip()
