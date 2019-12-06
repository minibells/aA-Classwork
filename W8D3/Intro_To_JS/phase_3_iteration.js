let unsorted = [2, 1, 4, 6, 7, 3];
let str = "kittens"

Array.prototype.bubbleSort = function() {
    let sorted;
    do {
        sorted = true;
        for (let i = 0; i < this.length - 1; i++) {
            let j = i + 1;
            if (this[i] > this[j] && this[j]) {
                [this[i], this[j]] = [this[j], this[i]];
                sorted = false;
            }
        }
    } while (!sorted);
    return this;
};

String.prototype.substrings = function() {
    let subs = [];
    for (let i = 0; i < this.length; i++){
        for (let j = i + 1; j < this.length; j++){
            subs.push(this.slice(i, j));
        }
    }
    return subs;
};
