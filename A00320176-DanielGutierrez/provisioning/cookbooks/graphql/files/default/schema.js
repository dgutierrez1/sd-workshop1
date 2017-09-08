var graphql = require ('graphql'); 
var Meme = require('./mongodb');
var {
  GraphQLObjectType,
  GraphQLSchema,
  GraphQLInt,
  GraphQLID,
  GraphQLList,
  GraphQLNonNull,
  GraphQLString,
  GraphQLFloat,
} = require('graphql');

var MemeType = new graphql.GraphQLObjectType({  
  name: 'meme',
  fields: function () {
    return {
      id: {
        type: graphql.GraphQLID
      },
      title: {
        type: graphql.GraphQLString
      },
      img: {
        type: graphql.GraphQLString
      },
      date: {
        type: graphql.GraphQLString
      },
      src: {
        type: graphql.GraphQLString
      },
      score: {
        type: graphql.GraphQLFloat
      }
    }
  }
});


var queryType = new graphql.GraphQLObjectType({  
  name: 'Query',
  fields: function () {
    return {
      memes: {
        type: new graphql.GraphQLList(MemeType),
        resolve: function () {
            Meme.find((err, memes)=> {
                if(err){
                    return err;
                }else{
                    return memes;
                }
            });
        }
      }
    }
  }
});
var MutationAdd = {  
  type: MemeType,
  args: {
    title: {
      name: 'Meme title',
      type: new GraphQLNonNull(GraphQLString)
    }
  },
  resolve: (root, args) => {
    var newMeme = new Meme({
      title: args.title,
      img: 'https://memegenerator.net/img/instances/500x/44851156/one-does-not-simply-vagrant-up.jpg',
      date: Date.now(),  
      src: 'google',
      score: 0
    });
    newMeme.id = newMeme._id
    return new Promise((resolve, reject) => {
      newMeme.save(function (err) {
        if (err) reject(err)
        else resolve(newMeme)
      })
    })
  }
}
var MutationType = new GraphQLObjectType({  
  name: 'Mutation',
  fields: {
    add: MutationAdd
  }
});
module.exports = new GraphQLSchema({  
  query: queryType,
  mutation: MutationType
});