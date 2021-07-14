var express = require('express');
var router = express.Router();
const indexController = require('../controllers/indexController');

/* GET home page. */
router.get('/home', function(request, response) {
  response.render('home')
});

router.get('/login', indexController.login);

router.get('/login/:id', indexController.cadastrarUsuario);

module.exports = router;
