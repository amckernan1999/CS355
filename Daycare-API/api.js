// Entry point
// This project utilizes an exisiting DB and leverages its functionality through an API
// Author: Andrew McKernan
// Date: 11/30/21

const koa = require('koa');
const defaultRouter = require('./routes/default.js');
const api = new koa();
const koajson = require('koa-json');
const bodyparser = require('koa-bodyparser');
const API_PORT = 8018;
//lets us take arguments
api.use(bodyparser());
api.use(koajson());
defaultRouter(api);

//opens port
api.listen(API_PORT, () => {
	console.log(`Listening on: ${API_PORT}`);
});

