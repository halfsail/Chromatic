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
function whatColor(size,arr1,arr2,arr3){
    if(size === 3){
        return arr1;
    }else if(size ===4){
        return arr2;
    }else{
        return arr3;
    }

}

//--- hint icons ---//

function whichIcon(size,arr1, arr2,arr3,arr4,arr5,arr6, index){
    if(size === 3){
        if(index === arr1[0] || index === arr1[2] || index === arr1[6] || index === arr1[8]){
          return "lock"
        } else if(arr1[index] === arr2[index]){
          return "ok"
        } else if(arr1[index] !== arr2[index]){
            return "close"
        } else {return ""}
    } else if(size === 4){
        if(index === arr3[0] || index === arr3[3] || index === arr3[12] || index === arr3[15]){
          return "lock"
        } else if(arr3[index] === arr4[index]){
          return "ok"
        } else if(arr3[index] !== arr4[index]){
            return "close"
        } else {return ""}
    } else {
        if(index === arr5[0] || index === arr5[4] || index === arr5[20] || index === arr5[24]){
          return "lock"
        } else if(arr5[index] === arr6[index]){
          return "ok"
        } else if(arr5[index] !== arr6[index]){
            return "close"
        } else {return ""}
    }
}

function whichButton(size,arr1, arr2,arr3, index){
    if(size === 3){
        if(index === arr1[0] || index === arr1[2] || index === arr1[6] || index === arr1[8]){
            return false
        }else {return true}
    }else if(size ===4){
        if(index === arr2[0] || index === arr2[3] || index === arr2[12] || index === arr2[15]){
            return false;
        } else { return true}
    } else{
        if(index === arr3[0] || index === arr3[4] || index === arr3[20] || index === arr3[24]){
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
