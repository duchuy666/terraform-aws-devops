FROM nginx:alpine
RUN echo '<h1>Chao Huy! Ung dung nay dang chay tren AWS Fargate Spot</h1>' > /usr/share/nginx/html/index.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
