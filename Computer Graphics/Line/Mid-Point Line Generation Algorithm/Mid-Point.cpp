#include <iostream>

using namespace std;

// Function to generate a line using Mid-Point algorithm
void midPointLine(int X1, int Y1, int X2, int Y2) {
    // Calculate dx & dy
    int dx = X2 - X1;
    int dy = Y2 - Y1;

    // Check if slope is less than or equal to 1
    if (abs(dy) <= abs(dx)) {
        // Initial value of decision parameter d
        int d = dy - (dx / 2);
        int x = X1, y = Y1;

        // Plot initial point
        cout << "(" << x << "," << y << ")" << endl;

        // Iterate through values of X
        while (x < X2) {
            x++;

            // Decision parameter update
            if (d < 0)
                d += dy;
            else {
                d += (dy - dx);
                y++;
            }

            // Plot intermediate points
            cout << "(" << x << "," << y << ")" << endl;
        }
    }
    // Slope greater than 1
    else {
        // Initial value of decision parameter d
        int d = dx - (dy / 2);
        int x = X1, y = Y1;

        // Plot initial point
        cout << "(" << x << "," << y << ")" << endl;

        // Iterate through values of Y
        while (y < Y2) {
            y++;

            // Decision parameter update
            if (d < 0)
                d += dx;
            else {
                d += (dx - dy);
                x++;
            }

            // Plot intermediate points
            cout << "(" << x << "," << y << ")" << endl;
        }
    }
}

// Driver code
int main() {
    int X1 = 2, Y1 = 2, X2 = 8, Y2 = 5;

    // Call the midPointLine function
    midPointLine(X1, Y1, X2, Y2);

    return 0;
}