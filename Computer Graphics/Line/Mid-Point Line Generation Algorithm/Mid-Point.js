<script>

// JavaScript program for the above approach

// midPoint function for line generation
function midPoint(X1, Y1, X2, Y2)
{

	// calculate dx & dy
	let dx = X2 - X1;
	let dy = Y2 - Y1;

	// initial value of decision
	// parameter d
	let d = dy - (dx/2);
	let x = X1, y = Y1;

	// Plot initial given point
	// putpixel(x,y) can be used to
	// print pixel of line in graphics
	document.write(x +"," + y + "<br/>");

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
		document.write(x + "," + y + "<br/>");
	}
}

// Driver Code
	let X1 = 2, Y1 = 2, X2 = 8, Y2 = 5;
	midPoint(X1, Y1, X2, Y2);
</script>
