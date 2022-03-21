const ownerController = require('../controller/owner-controller');
const ownerRouter = require('koa-router')({
	prefix: '/owner'
});

ownerRouter.get('/:id', ownerController.getUnvaccinatedOwnerById);
ownerRouter.delete('/:id', ownerController.remove);
ownerRouter.post('/', ownerController.addOwner);

module.exports = ownerRouter;
