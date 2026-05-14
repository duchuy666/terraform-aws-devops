const http = require('http');

const server = http.createServer((req, res) => {
  res.statusCode = 200;
  res.setHeader('Content-Type', 'text/plain');
  res.end('Chao Duy! Ung dung nay dang chay tren AWS Fargate Spot.\n');
});

const port = 80;
server.listen(port, () => {
  console.log(`Server running at port ${port}`);
});