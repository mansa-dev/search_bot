var express = require('express');
var router = express.Router();
var keywordsModel = require('../models').keywords;

/* GET home page. */
router.get('/', function(req, res, next) {
  	res.render('index', { title: 'Searchbot' }); 
});

router.get('/', function(req, res, next) {
  	res.render('index', { title: 'Searchbot' }); 
});

module.exports = router;
