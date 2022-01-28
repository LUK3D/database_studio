const sql = require('mssql')
const mysql = require('mysql2');
const sqlCommands = require("./sqlCommands.json");
const utils = require("./helpers.js");


function listDB({server, user, password,database, callback, engine = "mysql"  }){
    executeQuery({server:server,user:user,password:password, engine:engine,  database:database, query:((engine == "mysql")?sqlCommands.mysql.lisdb:sqlCommands.sqlServer.lisdb), onSuccess:(val)=>{
        callback && callback((val?(val.recordset)?val.recordset:val:null));
    }, onError:(val)=>{
        callback && callback(val);
    }})
}
function listTables({server, user, password,database, callback, engine = "mysql" }){


    console.log("MY DATABASE",database);

    executeQuery({server:server,user:user,password:password, engine:engine,  database:database, 
        query:((engine == "mysql")?
        utils.replace(sqlCommands.mysql.listtables,"${database}",database) 
        :utils.replace(sqlCommands.sqlServer.listtables,"${database}",database)), 
        onSuccess:(val,val2)=>{
        callback && callback((val?val:null));
    }, onError:(val)=>{
        callback && callback(val);
    }})
}
function listColumns({server, user, password, database,table, callback, engine = "mysql" }){
    executeQuery({server:server,user:user,password:password, engine:engine,  database:database, 

        query:((engine == "mysql")?
        utils.replace(sqlCommands.mysql.listcolumns,"${table}",table) 
        :utils.replace(sqlCommands.sqlServer.listcolumns,"${table}",table)),
        
        onSuccess:(val)=>{
        callback && callback((val?((val.ColumnDefinition)?val.ColumnDefinition:val):null));
    }, onError:(val)=>{
        callback && callback(val);
    }})
}

function listStoredProcedures({server, user, password,database, callback, engine = "mysql" }){
    executeQuery({server:server,user:user,password:password, engine:engine,  database:database, 
        
        query:((engine == "mysql")?
        utils.replace(sqlCommands.mysql.liststoredprocedures,"${database}",database) 
        :utils.replace(sqlCommands.sqlServer.liststoredprocedures,"${database}",database)),
    
    onSuccess:(val)=>{
        callback && callback((val?(val.recordset)?val.recordset:val:null));
    }, onError:(val)=>{
        callback && callback(val);
    }})
}

function storedProcedureScript({server, user, password, database,storedProcedure, callback, engine }){
    executeQuery({server:server,user:user,password:password, engine:engine,  database:database, 
        
        query:((engine == "mysql")?
        utils.replace(sqlCommands.mysql.storedproceduresscripts,"${storedProcedure}",storedProcedure) 
        :utils.replace(sqlCommands.sqlServer.storedproceduresscripts,"${storedProcedure}",storedProcedure)),
    
    onSuccess:(val)=>{
        callback && callback((val?(val.recordset)?val.recordset:val:null));
    }, onError:(val)=>{
        callback && callback(val);
    }})
}
function functions({server, user, password,database, callback, engine = "mysql" }){
    executeQuery({server:server,user:user,password:password, engine:engine,  database:database, 
        

        query:((engine == "mysql")?
        sqlCommands.mysql.functions 
        :sqlCommands.sqlServer.functions)
        
        
        , onSuccess:(val)=>{
        callback && callback((val?(val.recordset)?val.recordset:val:null));
    }, onError:(val)=>{
        callback && callback(val);
    }})
}
function relations({server, user, password,database, callback, engine = "mysql" }){
    executeQuery({server:server,user:user,password:password, engine:engine,  database:database, 
        
        query:((engine == "mysql")?
        sqlCommands.mysql.relations 
        :sqlCommands.sqlServer.relations)
        
        , onSuccess:(val)=>{
        callback && callback((val?(val.recordset)?val.recordset:val:null));
    }, onError:(val)=>{
        callback && callback(val);
    }})
}


 async function executeQuery({server,port, user, password, database, query, onSuccess, onError, engine = "mysql" }){
   
        try {

            if(engine == "mysql"){
                 console.log("Engine 1:",engine);

                const connection = mysql.createConnection({
                    host: utils.onEmpty(server,'localhost') +(utils.onEmpty((":"+(port||"")),"",3)),
                    user: utils.onEmpty(user,'root'),
                    password:utils.onEmpty(password,''),
                    database: utils.onEmpty(database,'information_schema'),
                  });

                  // simple query
                connection.query(
                    query,
                    function(err, results, fields) {
                        console.log(results,fields, err)
                        onSuccess && onSuccess(results);
                    // console.log(results); // results contains rows returned by server
                    // console.log(fields); // fields contains extra meta data about results, if available
                    }
                );

            }else{
                console.log("Engine:",engine);
                var w = await sql.connect(`Data Source=${server};Initial Catalog=${database||'DWDiagnostics'};Integrated Security=False;Uid=${user||'sa'};password=${password||'abc@123'};Connect Timeout=1800;;Trusted_Connection=True;TrustServerCertificate=True;`)
                var res = await (await sql.query(query))
                onSuccess && onSuccess(res.recordset||res);
                w.close();
            }

           
            
        
        
        } catch (err) {
            onError && onError(err)
        }
}

module.exports = {listDB,listTables,listColumns,listStoredProcedures,storedProcedureScript,functions,relations};