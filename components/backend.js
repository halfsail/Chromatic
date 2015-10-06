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

function whichArray(size){
    if(size === 4){
        return "array"
    }else{
        return "array15"
    }
}

function hexColorToRgb(hexString) {
    var colorVal = parseInt(hexString.slice(1), 16);
    return {
        r: (colorVal & 0xff0000) >> 16,
        g: (colorVal & 0xff00) >> 8,
        b: colorVal & 0xff
    }
}

function rgbToHexColor(color) {
    return "#" + ((1 << 24) + (color.r << 16) + (color.g << 8) + color.b).toString(16).slice(1);
}

function bilinearlyInterpolate(a, b, c, d, x, y) {
    return (
        a * (1 - x) * (1 - y) +
        b * x * (1 - y) +
        c * x * y +
        d * (1 - x) * y)
}

function generateInterpolatedArray(size, a, b, c, d) {
    // Generates a size * size array with interpolated colour values between the
    // given values for the corners a, b, c and d (clockwise from top-left)
    var arr = [];
    var x, y, x_frac, y_frac;
    var color;
    a = hexColorToRgb(a);
    b = hexColorToRgb(b);
    c = hexColorToRgb(c);
    d = hexColorToRgb(d);
    for (y = 0; y < size; y++) {
        y_frac = y / (size - 1);
        for (x = 0; x < size; x++) {
            x_frac = x / (size - 1);
            color = {
                r: Math.round(bilinearlyInterpolate(a.r, b.r, c.r, d.r, x_frac, y_frac)),
                g: Math.round(bilinearlyInterpolate(a.g, b.g, c.g, d.g, x_frac, y_frac)),
                b: Math.round(bilinearlyInterpolate(a.b, b.b, c.b, d.b, x_frac, y_frac))
            };
            arr.push(rgbToHexColor(color));
        }
    }
    return arr;
}
