let mysql = require('mysql');
let connection = mysql.createConnection({
    host: 'mysql-server-cloudxx.mysql.database.azure.com',
    user: 'esgi_cloud_admin@mysql-server-cloudxx',
    password: 'Thebeststanpasswordever95',
    database: 'cloud',
    dateStrings: 'date',
});

connection.connect();


module.exports = connection;
