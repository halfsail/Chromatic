function hello(){
    console.log("hello world")
}

function checkDay(){
    var day = new Date().getDate();
    return day;
}

function congrats(sides){
    return Math.floor((Math.random() * sides ));
}




//--- squares color ---//
function whatColor(size,arr1,arr2){
    if(size === 3){
        return arr1;
    }else{
        return arr2;
    }

}

//--- hint icons ---//

function whichIcon(size,arr1, arr2,arr3,arr4, index){
    if(size === 3){
        if(index === arr1[0] || index === arr1[2] || index === arr1[6] || index === arr1[8]){
          return "lock"
        } else if(arr1[index] === arr2[index]){
          return "ok"
        } else if(arr1[index] !== arr2[index]){
            return "close"
        } else {return ""}
    } else{
        if(index === arr1[0] || index === arr1[3] || index === arr1[12] || index === arr1[15]){
          return "lock"
        } else if(arr1[index] === arr2[index]){
          return "ok"
        } else if(arr1[index] !== arr2[index]){
            return "close"
        } else {return ""}
    }
}

function whichButton(size,arr1, arr2, index){
    if(size === 3){
        if(index === arr1[0] || index === arr1[2] || index === arr1[6] || index === arr1[8]){
            return false
        }else {return true}
    }else{
        if(index === arr2[0] || index === arr2[3] || index === arr2[12] || index === arr2[15]){
            return false;
        } else { return true}
    }

}

/* old function remove before publish

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
}*/

function whichArray(size){
    if(size === 4){
        return "array"
    }else{
        return "array15"
    }

}
