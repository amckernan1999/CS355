const db = require('../database/doggyDaycare-db')

class DogController{
   
   //gets dog info by ID, takes into account owner and name from ctx.params
   static async byId(ctx){
      try{
	 return new Promise((resolve,reject)=>{
            db.query({
		    sql: 'SELECT * FROM DD_Dog WHERE owner = ? AND name = ?;',
		    values: [ctx.params.id, ctx.params.name]
	    }, (err,res)=>{
	          if(err){
		   ctx.body = 'error';
		   ctx.status = 500;
		   reject(err);
		  }
		  ctx.body = `Name: ${res[0].name}\nOwner: ${res[0].owner}\nProgram: ${res[0].program}\nDOB: ${res[0].DOB}\nRabies: ${res[0].rabies}\nBordetella: ${res[0].bordetella}\nDistemper: ${res[0].distemper}\nBreed: ${res[0].breed}\n`;
		  ctx.status = 200;
		  resolve();
	       });
	 });
	} catch(error){console.log(`Error in DOg Controller: ${error}`);} 
    }
   
   //updates dog's program to 0000000 if not vaccinated, placeholder program for none
   static async dropUnvaccinatedDogs(ctx){ 
	   try{
		return new Promise((resolve,reject)=>{
		const program = ctx.request.body; 
	
		db.query({
			sql: `CALL DD_Drop_Unvaccinated_Dogs(?);`,
			values: [program.pid]
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
	   }catch(error){console.log(`Error in Dog Controller: ${error}`);}
   }
   
   // sets all vaccines to true in order to waive dog
   // currently not utilized as prioritized other put of same route 
   static async updateVaccines(ctx){
      try{
         return new Promise((resolve,reject)=>{
		    db.query({
		       sql: `UPDATE DD_Dog SET bordetella = 1, rabies = 1, distemper = 1 WHERE owner = ? and name = ?;`,
		       values: [ctx.params.id, ctx.params.name]
		    }, (err,res)=>{
		       if(err){
		          ctx.body = 'error';
			  ctx.status = 500;
			  reject(err);
		         
		      }
		      ctx.status = 200;
		      
		      resolve();
		   });
		 });
	}catch(error){console.log(`Error in Dog Controller: ${error}`);}
  }

   static async addDog(ctx){
      try{
	  return new Promise((resolve,reject)=>{
		  const dog = ctx.request.body;
		  db.query({
		     sql: `
			  INSERT INTO DD_Dog VALUES (?,?,?,?,?,?,?,?);`,
		     values: [dog.name, ctx.params.id, dog.program, dog.DOB, dog.rabies, dog.bordetella, dog.distemper,dog.breed]
	          }, (err,res)=>{
			  if(err){
				 ctx.body = err;
				 ctx.status = 500;
				 reject(err);
		          }
			  ctx.body = dog;
			  ctx.status = 200;
			  resolve()
		      });
	  });
	 }catch(error){console.log(`Error in Dog Controller: ${error}`);}
  }


}
module.exports = DogController;
