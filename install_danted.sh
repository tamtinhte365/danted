#!/bin/bash

set -e  # Dừng script nếu có lỗi xảy ra

# Tải Tailscale
curl -fsSL https://tailscale.com/install.sh | sh

# Tải file zip từ GitHub
wget https://github.com/Lozy/danted/archive/refs/heads/master.zip

# Cài đặt unzip nếu chưa có
sudo apt update && sudo apt install unzip -y

# Giải nén file zip
unzip master.zip

# Di chuyển vào thư mục đã giải nén
cd danted-master

# Cấp quyền thực thi cho các file script
sudo chmod +x *.sh

# Chạy script cài đặt
sudo ./install.sh

# Thêm user cho dịch vụ sockd
sudo /etc/init.d/sockd adduser tamtinhte giathinh2025

echo "Hoàn thành cài đặt danted và thêm user thành công!"
