import express from 'express';
var Schema = require('./schema');
import { graphql } from 'graphql';
import bodyParser from 'body-parser';


var PORT = 8080;
var app = express(); 

app.use(bodyParser.text({ type: 'application/graphql' }));

app.get('/', (req, res) => {

  graphql(schema, req.body).then((result) => {
    res.send(JSON.stringify(result, null, 2));
  });
});

let server = app.listen(PORT, function(){
  var host = server.address().address;
  var port = server.address().port;

  console.log('GraphQL listening at http://%s:%s', host, port);
})
