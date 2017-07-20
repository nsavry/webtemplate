// Node Require
var http = require("http");
var fs = require("fs");

// External Require
var mime = require("mime");
var express = require("express");

// Database Require
var MongoClient = require("mongodb").MongoClient;
var MongoObjectID = require("mongodb").ObjectID;
var ObjectID = require('mongodb').ObjectID


// Middlewares Require
var logger = require("morgan");
var serveStatic = require("serve-static");
var favicon = require("serve-favicon");
var bodyParser = require("body-parser");

// Global variable
var port = 8040;

// Middleware
var app = express();

app.use(favicon(__dirname + "/app/favicon.ico"));
app.use('/favicon.ico', express.static('app/favicon.ico'));
app.use(logger(":method :url"));
app.use(serveStatic(__dirname + "/app"));
app.use(function (req, res, next) {
	res.header('Access-Control-Allow-Origin', '*');
	res.header('Access-Control-Allow-Headers', 'X-Requested-With,content-type');
	next();
});


// API
var api = express();

app.use(bodyParser.urlencoded({extended: true}));
app.use(bodyParser.json());
	
app.use("/api", api);

http.createServer(app).listen(port);

console.log("Serveur démarré sur le port " + port);
