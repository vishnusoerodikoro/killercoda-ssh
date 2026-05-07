# SSH Lab Selesai!

## Yang Sudah Kamu Pelajari

| Step | Skill |
|------|-------|
| 1 | Setup environment — user & SSH service |
| 2 | SSH dengan password, host fingerprint, known_hosts |
| 3 | Generate key pair — `ssh-keygen`, public vs private key |
| 4 | `ssh-copy-id`, `authorized_keys`, permission kritis |
| 5 | Key-based login, `scp`, disable password auth, SSH config |

## Mental Model yang Harus Kamu Ingat

```
Private Key  =  Kunci  (di client, JANGAN dishare, jangan di-commit ke Git!)
Public Key   =  Gembok (di server, boleh dibagi ke siapa saja)

Permission wajib:
  ~/.ssh/              → 700
  ~/.ssh/authorized_keys → 600
  ~/.ssh/config          → 600
```

## Koneksi ke Materi Berikutnya

SSH adalah fondasi dari hampir semua tools DevOps:

```
SSH
 ├── Ansible    → deploy & config management via SSH
 ├── Git remote → push/pull via SSH key (bukan HTTPS)
 ├── SCP/rsync  → transfer file antar server
 ├── CI/CD      → pipeline SSH ke server untuk deploy
 └── Cloud VMs  → AWS EC2, GCP, Azure — semua pakai SSH key pair
```

Sekarang kamu siap masuk ke **Infrastructure & Load Balancing!**
