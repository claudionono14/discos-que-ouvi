const indexController = {
    
    login: (req, res) => {

        res.render('login', {nomepagina: 'login'})
    },

    cadastrarUsuario: (req, res) => {

        let { id } = req.params

        return console.log(id);

    }
}

module.exports = indexController;