module.exports = {
  build: {
    "index.html": "index.html",
    "app.js": [
      "javascripts/app.js"
    ],
    "app.css": [
      "stylesheets/app.css"
    ],
    "bootstrap.css": [
      "stylesheets/bootstrap.min.css"
    ],
    "jumbotron.css": [
      "stylesheets/jumbotron.css"
    ],
    "images/": "images/"
  },
  rpc: {
    host: "localhost",
    port: 8545
  }
};
