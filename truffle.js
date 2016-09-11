module.exports = {
  build: {
    "index.html": "index.html",
    "vote.html": "vote.html",
    "createcontract.html": "createcontract.html",
    "voteresults.html": "voteresults.html",
    "app.js": [
      "javascripts/app.js"
    ],
    "app.css": [
      "stylesheets/app.css"
    ],
    "jumbotron.css": [
      "stylesheets/jumbotron.css"
    ],
    "starter-template.css": [
      "stylesheets/starter-template.css"
    ],
    "images/": "images/"
  },
  rpc: {
    host: "localhost",
    port: 8545,
    from: "0x23926472c98e2f18c9c1d18727084a6677c652a9"
  }
};
