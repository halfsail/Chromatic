function hello(){
    console.log("hello world")
}

function checkDay(){
    var day = new Date().getDate();
    //console.log("Js day = " + day);
    return day;
}

function congrats(sides){
    return Math.floor((Math.random() * sides ));
}

//--- icon controls ---//
function iconvis(value){
    return value
}


function iconType(arr1, arr2, index){
    if(index === arr1[0] || index === arr1[2] || index === arr1[6] || index === arr1[8]){
      return "lock"
    } else if(arr1[index] === arr2[index]){
      return "ok"
    } else if(arr1[index] !== arr2[index]){
        return "close"
    } else {return ""}
}

function iconType2(arr1, arr2, index){
    if(index === arr1[0] || index === arr1[3] || index === arr1[12] || index === arr1[15]){
      return "lock"
    } else if(arr1[index] === arr2[index]){
      return "ok"
    } else if(arr1[index] !== arr2[index]){
        return "close"
    } else {return ""}
}

function visButton(arr1,index){
    if(index === arr1[0] || index === arr1[2] || index === arr1[6] || index === arr1[8]){
        return false
    }else {return true}
}
function visButton2(arr1,index){
    if(index === arr1[0] || index === arr1[3] || index === arr1[12] || index === arr1[15]){
        return false;
    } else { return true}
}

function whichArray(size){
    if(size === 4){
        return "array"
    }else{
        return "array15"
    }

}
