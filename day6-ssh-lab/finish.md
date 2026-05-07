# SSH Lab Selesai!

## Yang Sudah Kamu Pelajari

| Step | Skill |
|------|-------|
| 1 | SSH dengan password — cara kerja dasar |
| 2 | Generate key pair — public vs private key |
| 3 | `ssh-copy-id` & `authorized_keys` & permission |
| 4 | Key-based login, `scp`, disable password auth |
| 5 | SSH config file — alias dan default settings |

## Mental Model yang Harus Kamu Ingat

```
Private Key  =  Kunci  (ada di client, RAHASIA)
Public Key   =  Gembok (dipasang di server, boleh dibagi)

~/.ssh/              → permission 700
~/.ssh/authorized_keys → permission 600
~/.ssh/config          → permission 600
```

## Relevansi ke Materi Berikutnya

SSH adalah fondasi dari hampir semua tools DevOps:

```
SSH
 ├── Ansible      → deploy config via SSH
 ├── Git (remote) → push/pull via SSH key
 ├── SCP / rsync  → transfer file
 ├── CI/CD        → pipeline SSH ke server
 └── Cloud VMs    → AWS EC2, GCP, Azure semua pakai SSH key
```

Sekarang kamu siap masuk ke **Infrastructure & Load Balancing!**
