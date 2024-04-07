// JS program for DDA Line generation
 
function round(n) {
    if (n - Math.floor(n) < 0.5)
        return Math.floor(n);
    return Math.floor(n + 1);
};
 
function DDALine(x0, y0, x1, y1) {
    let dx = x1 - x0;
    let dy = y1 - y0;
    let step;
 
    if (Math.abs(dx) > Math.abs(dy))
        step = Math.abs(dx);
    else
        step = Math.abs(dy);
 
    let x_incr = (dx / step);
    let y_incr = (dy / step);
 
    let x = x0;
    let y = y0;
 
    for (let i = 0; i < step; i++) {
        console.log(round(x) + " " + round(y));
        x += x_incr;
        y += y_incr;
    }
};
 
let x0 = 200, y0 = 180, x1 = 180, y1 = 160;
DDALine(x0, y0, x1, y1);
