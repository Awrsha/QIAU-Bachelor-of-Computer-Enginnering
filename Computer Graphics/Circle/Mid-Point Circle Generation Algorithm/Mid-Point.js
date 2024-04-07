<script>
// javascript program for implementing
// Mid-Point Circle Drawing Algorithm
// Implementing Mid-Point Circle
	// Drawing Algorithm
	function midPointCircleDraw(x_centre , y_centre , r) {

		var x = r, y = 0;

		// Printing the initial point
		// on the axes after translation
		document.write("(" + (x + x_centre) + ", " + (y + y_centre) + ")");

		// When radius is zero only a single
		// point will be printed
		if (r > 0) {

			document.write("(" + (x + x_centre) + ", " + (-y + y_centre) + ")");

			document.write("(" + (y + x_centre) + ", " + (x + y_centre) + ")");

			document.write("(" + (-y + x_centre) + ", " + (x + y_centre) + ")<br/>");
		}

		// Initialising the value of P
		var P = 1 - r;
		while (x > y) {

			y++;

			// Mid-point is inside or on the perimeter
			if (P <= 0)
				P = P + 2 * y + 1;

			// Mid-point is outside the perimeter
			else {
				x--;
				P = P + 2 * y - 2 * x + 1;
			}

			// All the perimeter points have already
			// been printed
			if (x < y)
				break;

			// Printing the generated point and its
			// reflection in the other octants after
			// translation
			document.write("(" + (x + x_centre) + ", " + (y + y_centre) + ")");

			document.write("(" + (-x + x_centre) + ", " + (y + y_centre) + ")");

			document.write("(" + (x + x_centre) + ", " + (-y + y_centre) + ")");

			document.write("(" + (-x + x_centre) + ", " + (-y + y_centre) + ")<br/>");

			// If the generated point is on the
			// line x = y then the perimeter points
			// have already been printed
			if (x != y) {

				document.write("(" + (y + x_centre) + ", " + (x + y_centre) + ")");

				document.write("(" + (-y + x_centre) + ", " + (x + y_centre) + ")");

				document.write("(" + (y + x_centre) + ", " + (-x + y_centre) + ")");

				document.write("(" + (-y + x_centre) + ", " + (-x + y_centre) + ")<br/>");
			}
		}
	}

	// Driver code
	

		// To draw a circle of radius
		// 3 centered at (0, 0)
		midPointCircleDraw(0, 0, 3);
</script>
