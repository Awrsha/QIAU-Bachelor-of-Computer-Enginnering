# Python3 program for Mid-point
# line generation


# midPoint function for line generation
def midPoint(X1,Y1,X2,Y2):
	# calculate dx & dy
	dx = X2 - X1
	dy = Y2 - Y1

	# initial value of decision parameter d
	d = dy - (dx/2)
	x = X1
	y = Y1

	# Plot initial given point
	# putpixel(x,y) can be used to print pixel
	# of line in graphics
	print(x,",",y,"\n")
	# iterate through value of X
	while (x < X2):
		x=x+1
		# E or East is chosen
		if(d < 0):
			d = d + dy

		# NE or North East is chosen
		else:
			d = d + (dy - dx)
			y=y+1
	

		# Plot intermediate points
		# putpixel(x,y) is used to print pixel
		# of line in graphics
		print(x,",",y,"\n")
	

# Driver program

if __name__=='__main__':
	X1 = 2
	Y1 = 2
	X2 = 8
	Y2 = 5
	midPoint(X1, Y1, X2, Y2)