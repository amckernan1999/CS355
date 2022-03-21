const programController = require('../controller/program-controller');
const programRouter = require('koa-router')({
	prefix:'/program'
});

programRouter.get('/:pid', programController.getProgramById)
programRouter.delete('/:pid', programController.removeProgramById)
programRouter.put('/:pid', programController.updateProgramTime)

module.exports = programRouter;
