Array.prototype.myEach = function (callback) {
    debugger;
    for (let i = 0; i < this.length; i++) {
        callback(this[i]);
    }
};

function addOne(num) {
    debugger;
    return num + 1;
};
console.log([1,2,3].myEach(addOne));


Array.prototype.myMap = function (callback) {
    let newArray = [];
    debugger;
    let myEachCallback = function(ele) {
        debugger;
        newArray.push(callback(ele));
    }

    this.myEach(myEachCallback);

    return newArray;  
}

Array.prototype.myReduce = function (callback, initialValue) {
    let arr = this;
   
    if (initialValue === undefined) {
        initialValue = arr[0];
        arr = arr.slice(1);
    }

    let result = initialValue;

    arr.myEach(el => result = func(result, el));

    arr.myEach(callback)
    return result;
}

