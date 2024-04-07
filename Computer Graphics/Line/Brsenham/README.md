Given the coordinate of two points A(x1, y1) and B(x2, y2). The task is to find all the intermediate points required for drawing line AB on the computer screen of pixels. Note that every pixel has integer coordinates.

**Examples:**

> Input : A(0,0), B(4,4)  
> Output : (0,0), (1,1), (2,2), (3,3), (4,4)
> 
> Input : A(0,0), B(4,2)  
> Output : (0,0), (1,0), (2,1), (3,1), (4,2)

Below are some assumptions to keep the algorithm simple.

> 1.  We draw lines from left to right.
> 2.  x1 < x2 and y1< y2
> 3.  Slope of the line is between 0 and 1. We draw a line from lower left to upper right.

### **Naive Approach:**
[Python](https://github.com/Awrsha/Computer-Graphics/blob/master/Bersenham/Bresenham.py),[C++](https://github.com/Awrsha/Computer-Graphics/blob/master/Bersenham/Bresenham.cpp)

The above algorithm works, but it is slow. The idea of Bresenham’s algorithm is to avoid floating point multiplication and addition to compute mx + c, and then compute the round value of (mx + c) in every step. In Bresenham’s algorithm, we move across the x-axis in unit intervals.  

We always increase x by 1, and we choose about next y, whether we need to go to y+1 or remain on y. In other words, from any position (Xk, Yk) we need to choose between (Xk  + 1, Yk) and (Xk  + 1, Yk  + 1).
</div>
<div align="center">
<img align="center" height="250" width="375" alt="first" src="https://s2.uupload.ir/files/bresenhamline_zs4t.png"/></div>
<br />
We would like to pick the y value (among Yk  + 1 and Yk) corresponding to a point that is closer to the original line.  

We need a decision parameter to decide whether to pick Yk  + 1 or Yk  as the next point. The idea is to keep track of slope error from the previous increment to y. If the slope error becomes greater than 0.5, we know that the line has moved upwards one pixel and that we must increment our y coordinate and readjust the error to represent the distance from the top of the new pixel – which is done by subtracting one from the error.

## **How to avoid floating point arithmetic**

The above algorithm still includes floating point arithmetic. To avoid floating point arithmetic, consider the value below value m.

-   m = (y2 – y1)/(x2 – x1)
-   We multiply both sides by (x2 – x1)
-   We also change slope_error to slope_error * (x2 – x1). To avoid comparison with 0.5, we further change it to slope_error * (x2 – x1) * 2.
-   Also, it is generally preferred to compare with 0 than 1.
**Output**

(3,2)
(4,3)
(5,3)
(6,3)
(7,3)
(8,4)
(9,4)
(10,4)
(11,4)
(12,5)
(13,5)
(14,5)
(15,5)

**Time Complexity:**  O(x2 – x1)  
**Auxiliary Space:** O(1)  
The above explanation is to provide a rough idea behind the algorithm. For detailed explanation and proof, readers can refer below references.

The above program only works if the slope of the line is less than 1. Here is a program implementation for any kind of slope.

**Output**

100,110
101,110
102,111
103,111
104,112
105,112
106,112
107,113
108,113
109,114
110,114
111,114
112,115
113,115
114,116
115,116
116,116
117,117
118,117
119,118
120,118
121,118
122,119
123,119
124,120
125,120

**Related Articles:**

1.  [Mid-Point Line Generation Algorithm](https://www.geeksforgeeks.org/mid-point-line-generation-algorithm/)
2.  [DDA algorithm for line drawing](https://www.geeksforgeeks.org/dda-line-generation-algorithm-computer-graphics/)

This article is contributed by  [**Shivam Pradhan (anuj_charm)**](https://www.facebook.com/anuj.charm). If you like GeeksforGeeks and would like to contribute, you can also write an article using  [write.geeksforgeeks.org](http://write.geeksforgeeks.org/)  or mail your article to review-team@geeksforgeeks.org. See your article appearing on the GeeksforGeeks main page and help other Geeks.  
Please write comments if you find anything incorrect, or you want to share more information about the topic discussed above.

## System & Hardware 🛠  
<br> <summary><b>⚙️ Things I use to get stuff done</b></summary> <ul> <li><b>OS:</b> Windows 11</li> <li><b>Laptop: </b>TUF Gaming</li> <li><b>Code Editor:</b> Visual Studio Code - The best editor out there.</li> <li><b>To Stay Updated:</b> Medium, Linkedin and Instagram.</li> <br /> ⚛️ Checkout Our VSCode Configrations <a href="">Here</a>. </ul> <p align="center">💙 If you like my projects, Give them ⭐ and Share it with friends!</p></p><p align="center"><img height="27" src="https://raw.githubusercontent.com/mayhemantt/mayhemantt/Update/svg/Bottom.svg" alt="Github Stats" /></p>