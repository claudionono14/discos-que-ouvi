var express = require('express');
var router = express.Router();
const indexController = require('../controllers/indexController');

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Express' });
});

router.get('/login', indexController.login);

router.get('/login/:id', indexController.cadastrarUsuario);

module.exports = router;
