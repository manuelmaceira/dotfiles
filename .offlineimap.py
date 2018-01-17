import subprocess

def mailpasswd(account):
    path = "/home/micah/.mail-%s-passwd.gpg" % account
    return subprocess.check_output(["gpg2", "--pinentry-mode", "loopback", "--passphrase-file", "/home/micah/.gnupg/passphrase", "--quiet", "--batch", "-d", path]).strip()
