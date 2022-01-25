function replace(sentence,oldWord,newWord){
    
    return sentence.split(oldWord).join(newWord);
}


module.exports = {replace};