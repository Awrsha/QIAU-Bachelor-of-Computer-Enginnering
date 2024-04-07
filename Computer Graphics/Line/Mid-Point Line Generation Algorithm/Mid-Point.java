// Java program for Mid-point
// line generation
class GFG
{
// midPoint function for line generation
static void midPoint(int X1, int Y1,
					int X2, int Y2)
{
	// calculate dx & dy
	int dx = X2 - X1;
	int dy = Y2 - Y1;

	// initial value of decision
	// parameter d
	int d = dy - (dx/2);
	int x = X1, y = Y1;

	// Plot initial given point
	// putpixel(x,y) can be used to
	// print pixel of line in graphics
	System.out.print(x +"," + y + "\n");

	// iterate through value of X
	while (x < X2)
	{
		x++;

		// E or East is chosen
		if (d < 0)
			d = d + dy;

		// NE or North East is chosen
		else
		{
			d += (dy - dx);
			y++;
		}

		// Plot intermediate points
		// putpixel(x,y) is used to print
		// pixel of line in graphics
		System.out.print(x +"," + y + "\n");
	}
}

// Driver code
public static void main (String[] args)
{
	int X1 = 2, Y1 = 2, X2 = 8, Y2 = 5;
	midPoint(X1, Y1, X2, Y2);
}
}