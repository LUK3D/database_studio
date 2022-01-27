const express = require('express')
const bodyParser = require('body-parser');
const app = express()
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
const port = 3011
const db  = require("./database.js");
const h = require("./helpers");

app.get('/', (req, res) => {
        res.send("Welcome!")
})
app.post('/databases', (req, res) => {
    db.listDB({...req.body,callback:(resp)=>{
        console.log(resp)
        res.send(h.dbFromObject(resp));
    }})
})

app.get('/tables', (req, res) => {
    db.listTables({...req.body,callback:(resp)=>{
        res.send(resp)
    }})
})
app.get('/columns', (req, res) => {
    db.listColumns({...req.body,callback:(resp)=>{
        res.send(resp)
    }})
})
app.get('/sprocedures', (req, res) => {
    db.listStoredProcedures({...req.body,callback:(resp)=>{
        res.send(resp)
    }})
})
app.get('/spScript', (req, res) => {
    db.storedProcedureScript({...req.body,callback:(resp)=>{
        res.send(resp)
    }})
})
app.get('/functions', (req, res) => {
    db.functions({...req.body,callback:(resp)=>{
        res.send(resp)
    }})
})
app.get('/relations', (req, res) => {
    db.relations({...req.body,callback:(resp)=>{
        res.send(resp)
    }})
})




app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
  console.log(`http://127.0.0.1:${port}`)
})