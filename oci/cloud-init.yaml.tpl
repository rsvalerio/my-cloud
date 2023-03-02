#cloud-config
package_update: true
package_upgrade: true
package_reboot_if_required: true

packages:
  - apt-transport-https
  - ca-certificates
  - curl
  - gnupg-agent
  - software-properties-common
  - lsb-release
  - unattended-upgrades
  - jq

runcmd:
  - mkdir -m 0755 -p /etc/apt/keyrings
  - curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  - echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  - apt-get update -y
  - apt-get upgrade -y
  - apt-get install -y containerd.io
  - containerd config default | sed "s/SystemdCgroup\ =\ false/SystemdCgroup\ =\ true/" > /etc/containerd/config.toml
  - systemctl restart containerd

# write_files:
#   - path: /etc/ssh/sshd_config
#     content: |
#          Port 4444
#          Protocol 2
#          HostKey /etc/ssh/ssh_host_rsa_key
#          HostKey /etc/ssh/ssh_host_dsa_key
#          HostKey /etc/ssh/ssh_host_ecdsa_key
#          HostKey /etc/ssh/ssh_h
