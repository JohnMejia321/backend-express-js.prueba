const express = require('express');
const app = express();
const http = require('http');
const server = http.createServer(app);
const logger = require('morgan');
const cors = require('cors');


const port = process.env.PORT || 3000;

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({
    extended: true
}));

app.use(cors());


app.disable('x-powered-by');

app.set('port', port);


/*
* RUTAS
*/
const users = require('./routes/usersRoutes');


server.listen(3000,  ' 0.0.0.0'  , function() {
    console.log('Aplicacion de NodeJS ' + port + ' Iniciada...')
});

//RUTAS TEST
app.get('/', (req, res) => { 
    res.send('Ruta raiz del backend')
});

app.get('/test', (req, res) => { 
    res.send('Esta es la ruta del TEST')
});

/*
* LLAMANDO A LA RUTAS
*/
users(app);


// ERROR HANDLER
app.use((err, req, res, next) => {
    console.log(err);
    res.status(err.status || 500).send(err.stack);
});

module.exports = {
    app: app,
    server: server
}

