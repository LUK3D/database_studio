const express = require('express')
const bodyParser = require('body-parser');
const app = express()
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
const port = 3011




const db  = require("./database.js");

app.get('/', (req, res) => {
        res.send("Welcome!")
})
app.post('/databases', (req, res) => {
    db.listDB({...req.body,callback:(resp)=>{
        res.send(resp)
    }})
})

app.get('/tables', (req, res) => {
    db.listTables({server:"LLDESWKSHP0421",user:"sa",password:"abc@123",database:"MASI_TESTES",callback:(resp)=>{
        res.send(resp)
    }})
})
app.get('/columns', (req, res) => {
    db.listColumns({server:"LLDESWKSHP0421",user:"sa",password:"abc@123",database:"MASI_TESTES",table:"APPS",callback:(resp)=>{
        res.send(resp)
    }})
})
app.get('/sprocedures', (req, res) => {
    db.listStoredProcedures({server:"LLDESWKSHP0421",user:"sa",password:"abc@123",database:"MASI_TESTES",callback:(resp)=>{
        res.send(resp)
    }})
})
app.get('/spScript', (req, res) => {
    db.storedProcedureScript({server:"LLDESWKSHP0421",user:"sa",password:"abc@123",database:"MASI_TESTES",storedProcedure:"PROC_PERFIL_GRUPO_ALTERAR",callback:(resp)=>{
        res.send(resp)
    }})
})
app.get('/functions', (req, res) => {
    db.functions({server:"LLDESWKSHP0421",user:"sa",password:"abc@123",database:"MASI_TESTES",callback:(resp)=>{
        res.send(resp)
    }})
})
app.get('/relations', (req, res) => {
    db.relations({server:"LLDESWKSHP0421",user:"sa",password:"abc@123",database:"MASI_TESTES",callback:(resp)=>{
        res.send(resp)
    }})
})




app.listen(port, () => {
  console.log(`Example app listening on port ${port}`)
  console.log(`http://127.0.0.1:${port}`)
})