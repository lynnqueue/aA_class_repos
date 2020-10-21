Array.prototype.uniq = function() {
    let newArray = [];
    for (let i = 0; i < this.length; i++) {
        if (newArray.indexOf(this[i]) === -1) {
            newArray.push(this[i]);
        }
    }
    return newArray;
};

console.log([1,1,1,2,3].uniq());

Array.prototype.two_sum = function(){
    let pairs = [];
    for (let i = 0; i < this.length; i++) {
        for (let j = i+1; j < this.length; j++){
            if (this[i] + this[j] === 0) {
                pairs.push([i,j]);
            }
        }
    }
    return pairs;
};

console.log([1,0,-1,3,5,7,2,-3].two_sum());


Array.prototype.transpose = function() {
    let newArray = [];
    for (let outer = 0; outer < this.length; outer++) {
        let temArr = [];
        for (let inner = 0; inner < array.length; inner++) {
            temArr.push(this[inner][outer]);
        }
        newArray.push(temArr);
    }
    return newArray;
};

let array = [[1,2,3],[4,5,6],[7,8,9]];
console.log(array.transpose());