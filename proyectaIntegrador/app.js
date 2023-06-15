var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');
const session = require('express-session');

var indexRouter = require('./routes/index');
var usersRouter = require('./routes/users');
let productosRouter = require("./routes/productos");



/// nuevo
var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'ejs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));

app.use(session({
  secret: 'Este es el secreto', 
  resave:false,
  saveUninitialized:false
}))

app.use(function(req, res, next){ //next: funcion callback que tiene express

  if (req.session.user != undefined ){
    console.log('TOMA LA SESION')
    res.locals.estaLogueado = true
    res.locals.user = req.session.user
    console.log('defu=inido');
  } else {
    console.log('NO TOMA LA SESION')
    res.locals.estaLogueado = false
    res.locals.user=undefined
    console.log('sin definir');
  }
  return next()
})

app.use('/', indexRouter);
app.use('/users', usersRouter);
app.use("/productos",productosRouter)  /// nuevo

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
