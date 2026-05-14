# Sử dụng phiên bản nhẹ của Node.js
FROM node:18-slim

# Tạo thư mục làm việc trong container
WORKDIR /app

# Copy file code vào
COPY index.js .

# Mở cổng 80
EXPOSE 80

# Lệnh khởi chạy ứng dụng
CMD ["node", "index.js"]