const sql = require('mssql')

function listDB({server, user, password, database, callback }){
    executeQuery({server:server,user:user,password:password,  database:database, query:`SELECT name FROM sys.databases
    WHERE name NOT IN ('master', 'model', 'tempdb', 'msdb', 'Resource')`, onSuccess:(val)=>{
        callback && callback(val.recordset);
    }, onError:(val)=>{
        callback && callback(val);
    }})
}
function listTables({server, user, password, database, callback }){
    executeQuery({server:server,user:user,password:password,  database:database, query:`
    SELECT TABLE_NAME 
    FROM INFORMATION_SCHEMA.TABLES 
    WHERE TABLE_TYPE = 'BASE TABLE' 
        AND TABLE_CATALOG='${database}'`, onSuccess:(val)=>{
        callback && callback(val.recordset);
    }, onError:(val)=>{
        callback && callback(val);
    }})
}
function listColumns({server, user, password, database,table, callback }){
    executeQuery({server:server,user:user,password:password,  database:database, query:`
    SELECT *
    FROM INFORMATION_SCHEMA.COLUMNS
    WHERE TABLE_NAME = '${table}'
    ORDER BY ORDINAL_POSITION
   
    `, onSuccess:(val)=>{
        callback && callback(val.recordset);
    }, onError:(val)=>{
        callback && callback(val);
    }})
}

function listStoredProcedures({server, user, password, database, callback }){
    executeQuery({server:server,user:user,password:password,  database:database, query:`
    Select * from sysobjects where type = 'P' and category = 0
    `, onSuccess:(val)=>{
        callback && callback(val.recordset);
    }, onError:(val)=>{
        callback && callback(val);
    }})
}

function storedProcedureScript({server, user, password, database,storedProcedure, callback }){
    executeQuery({server:server,user:user,password:password,  database:database, query:`
    USE MASI_TESTES
    SELECT  OBJECT_DEFINITION (OBJECT_ID(N'${storedProcedure}') ) As SCRIPT;
    `, onSuccess:(val)=>{
        callback && callback(val.recordset);
    }, onError:(val)=>{
        callback && callback(val);
    }})
}
function functions({server, user, password, database, callback }){
    executeQuery({server:server,user:user,password:password,  database:database, query:`
    SELECT name, definition, type_desc 
    FROM sys.sql_modules m 
    INNER JOIN sys.objects o 
            ON m.object_id=o.object_id
    WHERE type_desc like '%function%'
    `, onSuccess:(val)=>{
        callback && callback(val.recordset);
    }, onError:(val)=>{
        callback && callback(val);
    }})
}
function relations({server, user, password, database, callback }){
    executeQuery({server:server,user:user,password:password,  database:database, query:`
    SELECT src.name AS 'TABLE', srcCol.name AS 'COLUMN' , dst.name AS 'PK_TABLE', dstCol.name AS 'PK_COLUMN' FROM sys.foreign_key_columns fk 
    INNER JOIN sys.columns srcCol ON fk.parent_column_id = srcCol.[column_id]  
        AND fk.parent_object_id = srcCol.[object_id]
    INNER JOIN sys.tables src ON src.[object_id] = fk.parent_object_id
    INNER JOIN sys.tables  dst  ON dst.[object_id] = fk.[referenced_object_id] 
    INNER JOIN sys.columns dstCol ON fk.referenced_column_id = dstCol.[column_id] 
        AND fk.[referenced_object_id] = dstCol.[object_id]


        
    `, onSuccess:(val)=>{
        callback && callback(val.recordset);
    }, onError:(val)=>{
        callback && callback(val);
    }})
}


 async function executeQuery({server,port, user, password, database, query, onSuccess, onError }){
   
        try {
            await sql.connect(`Data Source=${server};Initial Catalog=${database||'DWDiagnostics'};Integrated Security=False;Uid=${user||'sa'};password=${password||'abc@123'};Connect Timeout=1800;;Trusted_Connection=True;TrustServerCertificate=True;`)
            const result = await sql.query(query)
            onSuccess && onSuccess(result);
        } catch (err) {
            onError && onError(err)
        }
}

module.exports = {listDB,listTables,listColumns,listStoredProcedures,storedProcedureScript,functions,relations};