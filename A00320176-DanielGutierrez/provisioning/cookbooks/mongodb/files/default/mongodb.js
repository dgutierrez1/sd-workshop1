var mongoose = require('mongoose');

var Meme = mongoose.model('Meme', {  
  id: mongoose.Schema.Types.ObjectId,
  title: String,
  img: String,
  date: String,
  score: Number,
  src: String
});

module.exports = Meme;
