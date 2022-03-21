const mysql = require('mysql');

const connection = mysql.createConnection({
	port: 3306,
	database: 'mckernan_cs355fa21',
	user: 'mckernan_cs355fa21',
	password: 'mc7609934',
	debug: false,
	host: '127.0.0.1'
});
module.exports = connection;
