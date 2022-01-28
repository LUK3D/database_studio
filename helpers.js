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

function renameObject(object,newname){
 return   Object.fromEntries(
        Object.entries(object).map(([key, value]) => 
          // Modify key here
          [newname, value]
        )
      )
}

function emptyOrNull(val, lengthCheck = 0){

    if(val ==null || val == undefined)
    return true;
    if(typeof(val) == "string"){
        if(val.trim().length<lengthCheck){
            return true;
        }
    }

    return false;

}
function onEmpty(value, holder,lengthCheck = 0){
   return this.emptyOrNull(value,lengthCheck)?holder||"":value;
}

module.exports = {replace,dbFromObject, renameObject,emptyOrNull,onEmpty };