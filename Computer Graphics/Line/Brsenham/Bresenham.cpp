// A naive way of drawing a line
void naiveDrawLine(int x1, int x2, int y1, int y2) {
    float m = static_cast<float>(y2 - y1) / (x2 - x1);
    for (int x = x1; x <= x2; x++) {
        int y = round(m * (x - x1) + y1);
        print(x, y); // Assuming there's a function to print a point
    }
}

// C++ program for Bresenham's Line Generation

#include <iostream>

using namespace std;

void plotPixel(int x1, int y1, int x2, int y2, int dx, int dy, int decide) {
    int pk = 2 * dy - dx;
    for (int i = 0; i <= dx; i++) {
        cout << x1 << "," << y1 << endl;
        x1 < x2 ? x1++ : x1--;
        if (pk < 0) {
            if (decide == 0) {
                pk = pk + 2 * dy;
            } else {
                pk = pk + 2 * dy;
            }
        } else {
            y1 < y2 ? y1++ : y1--;
            if (decide == 0) {
                // putpixel(x1, y1, RED);
            } else {
                // putpixel(y1, x1, YELLOW);
            }
            pk = pk + 2 * dy - 2 * dx;
        }
    }
}

int main() {
    int x1 = 100, y1 = 110, x2 = 125, y2 = 120, dx, dy, pk;

    dx = abs(x2 - x1);
    dy = abs(y2 - y1);

    // If slope is less than one
    if (dx > dy) {
        // passing argument as 0 to plot(x,y)
        plotPixel(x1, y1, x2, y2, dx, dy, 0);
    }
    // if slope is greater than or equal to 1
    else {
        // passing argument as 1 to plot (y,x)
        plotPixel(y1, x1, y2, x2, dy, dx, 1);
    }
    return 0;
}