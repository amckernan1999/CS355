const ownerRouter = require('./owner');
const dogRouter = require('./dog');
const programRouter = require('./program');

const defaultRouter = require('koa-router')({
	prefix: '/api/v1'
});

const helloworld = function(ctx) {
	ctx.body = 'Welcome to my DoggyDaycare API!';
};

defaultRouter.get('/', helloworld);

//acts as a router entry point for other routers
defaultRouter.use(
	ownerRouter.routes(),
	dogRouter.routes(),
	programRouter.routes()
)

module.exports = (api) => {
	api.use(defaultRouter.routes())
};

