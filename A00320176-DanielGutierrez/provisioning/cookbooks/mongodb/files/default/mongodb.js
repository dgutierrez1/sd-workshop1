var mongoose = require('mongoose');
mongoose.connect('mongodb://localhost/memes');

var db = mongoose.connection;

//Bind connection to error event (to get notification of connection errors)
db.on('error', console.error.bind(console, 'MongoDB connection error:'));

var Meme = mongoose.model('Meme', {  
  id: mongoose.Schema.Types.ObjectId,
  title: String,
  img: String,
  date: String,
  score: Number,
  src: String
});

module.exports = Meme;
