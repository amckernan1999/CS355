const db = require('../database/doggyDaycare-db');

class ProgramController{
   //returns a program quieried by id 
   static async getProgramById(ctx){
      try{
	  return new Promise((resolve,reject)=>{
          db.query({
	      sql: `SELECT * FROM DD_Training_Program WHERE programID = ?;`,
	      values: [ctx.params.pid]
	  }, (err,res)=>{
	     if(err){
		     ctx.body = err
		     ctx.status = 500;
		     reject(err);
	      }
		  ctx.body = `Program ID: ${res[0].programID}\nTitle: ${res[0].title}\nTime: ${res[0].time}\n`;
		  ctx.status = 200;
		  resolve();

	  });
	});
       } catch(error){console.log(`Error in Program Controller: ${error}`);}
   }

   //updates a program by changing the time
   static async updateProgramTime(ctx){
      try{
	   return new Promise((resolve,reject)=>{
	   const program = ctx.request.body;
	   db.query({
	      sql: `UPDATE DD_Training_Program SET time =  ? WHERE programID = ?;`,
	      values:[program.time, ctx.params.pid]
	   }, (err,res)=>{
		 if(err){
	            ctx.body = err;
	            ctx.status = 500;
	            reject(err);
	          }
		  ctx.body = program;
		  ctx.status = 200;
		  resolve();
		});
	   });
	  } catch(error){console.log(`Error in Program Controller: ${error}`);}
   }

   //removes a program searched for by id
   static async removeProgramById(ctx){
      try{
	 return new Promise((resolve,reject)=>{
		 db.query({
	            sql:'DELETE FROM DD_Training_Program WHERE programID = ?;',
	            values: [ctx.params.pid]
	         }, (err,res)=>{
			 if(err){
				 ctx.body = err;
				 ctx.status = 500;
				 reject(err);
			 }
			 ctx.body = `Program with programID [${ctx.params.pid}] deleted.\n`;
			 ctx.status = 200;
			 resolve();
		});
	});
	}catch(error){console.log(`Error in Program Controller: ${error}`);}
   }

	

}
module.exports = ProgramController;
