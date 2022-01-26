function replace(sentence,oldWord,newWord){
    
    return sentence.split(oldWord).join(newWord);
}


function dbFromObject(db){

    if(!db || db.length<0){
        return [];
    }
    if(db[0].Database){
       return   db.map(x=>{
            return {name:x.Database}
        });
    }else{
        return db;
    }



}

module.exports = {replace,dbFromObject};