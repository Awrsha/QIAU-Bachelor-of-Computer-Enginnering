// C# program for Bresenhams Line Generation

using System;

class GFG {
	static public void plotPixel(int x1, int y1, int x2,
								int y2, int dx, int dy,
								int decide)
	{
		// pk is initial decision making parameter
		// Note:x1&y1,x2&y2, dx&dy values are interchanged
		// and passed in plotPixel function so
		// it can handle both cases when m>1 & m<1
		int pk = 2 * dy - dx;
		for (int i = 0; i <= dx; i++) {
			Console.Write(x1 + "," + y1 + "\n");
			// checking either to decrement or increment the
			// value if we have to plot from (0,100) to
			// (100,0)
			if (x1 < x2)
				x1++;
			else
				x1--;
			if (pk < 0) {
				// decision value will decide to plot
				// either x1 or y1 in x's position
				if (decide == 0) {
					pk = pk + 2 * dy;
				}
				else
					pk = pk + 2 * dy;
			}
			else {
				if (y1 < y2)
					y1++;
				else
					y1--;
				pk = pk + 2 * dy - 2 * dx;
			}
		}
	}

	// Driver code
	static public void Main()
	{
		int x1 = 100, y1 = 110, x2 = 125, y2 = 120, dx, dy;
		dx = Math.Abs(x2 - x1);
		dy = Math.Abs(y2 - y1);
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
	}
}
