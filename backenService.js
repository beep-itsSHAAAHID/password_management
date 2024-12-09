// backendService.js
const express = require('express');
const { exec } = require('child_process');

const app = express();
const port = 7545;

app.post('/migrate', (req, res) => {
  // Execute truffle migrate command
  exec('truffle migrate', (error, stdout, stderr) => {
    if (error) {
      console.error(`Error: ${error.message}`);
      res.status(500).send('Truffle migrate failed');
      return;
    }
    if (stderr) {
      console.error(`stderr: ${stderr}`);
      res.status(500).send('Truffle migrate failed');
      return;
    }
    console.log(`stdout: ${stdout}`);
    res.send('Truffle migrate successful');
  });
});

app.listen(port, () => {
  console.log(`Backend service listening at http://localhost:${port}`);
});
