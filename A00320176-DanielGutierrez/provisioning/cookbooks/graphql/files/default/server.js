import express from 'express';
var Schema = require('./schema');
import { graphql } from 'graphql';
import bodyParser from 'body-parser';
var graphQLHTTP = require('express-graphql')  
var cors = require('cors');


var PORT = 8080;
var app = express(); 



app.use(cors());


var query = 'query { memes { id, title, src } }'  
graphql(Schema, query).then( function(result) {  
  console.log(JSON.stringify(result,null," "));
});
//app.use(bodyParser.text({ type: 'application/graphql' }));

app.use('/', graphQLHTTP({ schema: Schema, pretty: true }))
.listen(PORT, function (err) {
  console.log('GraphQL Server is now running on 192.168.56.102:'+PORT);
});


