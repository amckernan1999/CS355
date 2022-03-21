const db = require('../database/doggyDaycare-db');

class OwnerController{
   
   //leverages view in order to get a specific owner whose dog is not vaccinated
   static async getUnvaccinatedOwnerById(ctx){
      try{
         return new Promise((resolve,reject)=>{
	    const query = 'SELECT * FROM DD_Unvaccinated_Info WHERE owner IN (SELECT name FROM DD_Owner WHERE customerID = ?) LIMIT 1';
	    db.query(
	    {
	       sql: query,
	       values:[ctx.params.id]
            },
	    (err,res)=>{
	       if(err){reject(err);}   
	       ctx.body = 
	      `Name: ${res[0].Owner}\nPhone Number: ${res[0].Phone}\nPet: ${res[0].Dog}\nRabies: ${res[0].rabies}\nBordetella: ${res[0].bordetella}\nDistemper: ${res[0].distemper}\n`;
			   
	       ctx.status = 200;
	       resolve();
	   });
         });
	   } catch(error){console.log('Error in Owner Controller.');
	   }
    }
   
   //adds an owner that it is passed through ctx.request as a json object
   static async addOwner(ctx){
      try{
	    return new Promise((resolve,reject)=>{
	       const owner = ctx.request.body;
               db.query({
	          sql: 'INSERT INTO DD_Owner VALUES (?,?);',
		  values: [owner.name, owner.customerID]
		  }, (err,res) =>{
		     if(err){
		        ctx.body = 'err'
			ctx.status = 500;
			reject(err);
		     }
	            ctx.body = owner;
	            ctx.status = 200;
	            resolve();
		});
	      });
	   } catch(error){console.log(`Error in Owner Controller: ${error}`);}
	 }
   //removes an owner by ID
   static async remove(ctx){
      try{
         return new Promise((resolve,reject)=>{
		 
		 db.query({
	            sql: 'DELETE FROM DD_Owner WHERE customerID =?;',
		    values: [ctx.params.id]
		 }, (err,res) =>{
		       if(err){
		          ctx.body = err;
			  ctx.status = 500;
			  reject(err);
	               }
		   ctx.body =`Owner with customerID [${ctx.params.id}] deleted.\n`;
		   ctx.status = 200;
		   resolve();
		});
        });
      } catch(error){console.log(`Error in Owner Controller: ${error}`);}
   }

}
module.exports = OwnerController;
