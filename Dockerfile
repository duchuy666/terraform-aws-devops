FROM nginx:alpine
RUN echo '<h1>Chao Huy! Day la phien ban 2.0 - CI/CD tu dong deploy!</h1>' > /usr/share/nginx/html/index.html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]