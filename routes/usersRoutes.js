const UsersController = require('../controllers/usersControllers');



module.exports = (app) => {

    // TRAER DATOS
    app.get('/api/users/get', UsersController.getAll);
    app.post('/api/users/create', UsersController.register);

}