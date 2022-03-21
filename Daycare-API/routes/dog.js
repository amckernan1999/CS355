const dogController = require('../controller/dog-controller');
const dogRouter = require('koa-router')({
   prefex: '/dog'
});

dogRouter.get('/owner/:id/dog/:name', dogController.byId);

//This functionality is currently paused as I can not have two puts with the same path
//dogRouter.put('/owner/:id/dog/:name', dogController.updateVaccines);
dogRouter.put('/owner/:id/dog/:name', dogController.dropUnvaccinatedDogs);
dogRouter.post('/owner/:id/dog', dogController.addDog);

module.exports = dogRouter;
