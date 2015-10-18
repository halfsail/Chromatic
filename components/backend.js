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

function all(predicate, array) {
    for (var i = 0; i < array.length; i++) {
        if (! predicate(i, array[i])) {
            return false;
        }
    }
    return true;
}

function swap(arr, index_a, index_b) {
    var temp = arr[index_a];
    arr[index_a] = arr[index_b];
    arr[index_b] = temp;
}

function shuffle(arr) {
    var counter = arr.length;
    var temp, index;
    while (counter > 0) {
        index = Math.floor(Math.random() * counter);
        counter--;
        swap(arr, counter, index);
    }
}

function isCorner(index, size) {
    // Returns whether a given index in a grid array corresponds to a corner
    // square
    index++;
    var end = size * size;
    return index == 1 || index == size || index == end || index == (end - size + 1);
}

function generateRandomizedArray(size) {
    // Generates a randomised game state, where size is the side length of the
    // game grid
    var arr = [], corners = [];
    var i;
    for (i = 0; i < size * size; i++) {
        if (isCorner(i, size)) {
            corners.push(i);
        } else {
            arr.push(i);
        }
    }
    shuffle(arr);
    for (i = 0; i < corners.length; i++) {
        arr.splice(corners[i], 0, corners[i]);
    }
    return arr;
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

function hexColorIsBright(hexString) {
    // See http://stackoverflow.com/questions/946544/good-text-foreground-color-for-a-given-background-color
    var color = hexColorToRgb(hexString);
    var gray = color.r * 0.299 + color.g * 0.587 + color.b * 0.114;
    return gray > 128;
}

function bilinearlyInterpolate(a, b, c, d, x, y) {
    return (
        a * (1 - x) * (1 - y) +
        b * x * (1 - y) +
        c * x * y +
        d * (1 - x) * y)
}

function generateInterpolatedArray(size, corner_colors) {
    // Generates a size * size array with interpolated colour values between the
    // given values for the corners (an array of four hex colours clockwise from
    // top-left)
    var arr = [];
    var x, y, x_frac, y_frac;
    var color;
    var a = hexColorToRgb(corner_colors[0]);
    var b = hexColorToRgb(corner_colors[1]);
    var c = hexColorToRgb(corner_colors[2]);
    var d = hexColorToRgb(corner_colors[3]);
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
