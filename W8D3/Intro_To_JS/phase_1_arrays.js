Array.prototype.uniq = function() {
    let uniq = [];
    for (let i = 0; i < this.length; i++) {
        let el = this[i];
        if (uniq.indexOf(el) < 1) {
            uniq.push(el);
        }
    }
    return uniq;
}

Array.prototype.twoSum = function() {
    let pairs = [];
    for (let i = 0; i < this.length; i++) {
        let var1 = this[i];
        for (let j = i + 1; j < this.length; j++) {
            let var2 = this[j];
            if (var1 + var2 === 0) {
                pairs.push(i, j);
            }
        }
    }
    return pairs;
}

Array.prototype.transpose = function() {
    const rows = this.length, cols = this[0].length;
    const grid = [];
    for (let j = 0; j < cols; j++) {
        grid[j] = Array(rows);
    }
    for (let i = 0; i < rows; i++) {
        for (let j = 0; j < cols; j++) {
            grid[j][i] = this[i][j];
        }
    }
    return grid;
}
