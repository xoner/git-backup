Simple, yet powerful, script to make periodic, snapshot like, backups of a folder using the power of git and unix.

## Configuration

Clone this repository somewhere in your local computer:

```bash
git clone https://github.com/xoner/git-backup.git /home/username/src/git-backup/
```

Initialize an empty repository in the directory you want to make periodic backups:

```bash
cd /home/username/Documents
git init
```

Add a remote repository, named origin, where the backups will be stored:

```bash
git remote add origin git@yourserver:git/repo/location/repo.git
```

Configure your user crontab to make the periodical backups (in our case every hour):

```bash
crontab -e 
```

Add this line to your user crontab:

`0 * * * * /home/username/src/git-backup/git-backup.sh /home/username/Documents >/dev/null 2>&1`

