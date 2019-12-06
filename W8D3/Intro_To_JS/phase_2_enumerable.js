let array = [1, 2, 3];


Array.prototype.myEach = function(callback) {
    for (let i = 0; i < this.length; i++) {
        let ele = this[i];
        callback(ele);
    }
};

Array.prototype.myMap = function(callback) {
    let mapped =[];
    this.myEach(ele => mapped.push(callback(ele)));
    return mapped;
};


function doubleNum(num) {
    return num * 2;
};

Array.prototype.myReduce = function(callback, init = this[0]) {
    let arr = this;
    if (init === this[0]) {
        arr = this.slice(1); 
    }
    let result = init;

    arr.myEach(ele => result = callback(result, ele));
    
    return result;
};
