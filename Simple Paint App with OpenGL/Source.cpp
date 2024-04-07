#include <GL/freeglut.h>  // OpenGL Utility Toolkit for creating OpenGL applications
#include <GL/glu.h>  // OpenGL Utility Library for OpenGL functionality
#include <cstdio>  // Standard input/output operations
#include <cmath>  // Mathematical functions
#include <cstdlib>  // General utilities library

// Constants
const int MAX_SHAPES = 100;  // Maximum number of shapes supported
const float M_PI = 3.14159265358979323846;  // Pi constant
#define _CRT_SECURE_NO_WARNINGS  // Suppress warnings for certain functions

// Enumeration for different shape types
enum ShapeType {
    LINE = 1,
    RECTANGLE,
    CIRCLE,
    TRIANGLE,
    SQUARE,
    ELLIPSE
};

// Structure to represent a 2D point
struct Point {
    float x, y;
};

// Structure to represent a shape
struct Shape {
    Point start, end;  // Start and end points of the shape
    float r, g, b;  // Color components (red, green, blue)
    ShapeType type;  // Type of the shape
    float thickness;  // Thickness of lines for the shape
    int isFilled;  // Flag to indicate if the shape is filled
};


// Array of shapes and related variables
Shape shapes[MAX_SHAPES];
int shapesCount = 0;
Shape undoStack[MAX_SHAPES];
int undoCount = 0;
char filename[256];
Point startDrag, endDrag;
int isMouseDragging = 0;
float red = 0.0f, green = 0.0f, blue = 0.0f;
float bgRed = 1.0f, bgGreen = 1.0f, bgBlue = 1.0f;
ShapeType currentShapeType = LINE;
float lineThickness = 1.0f;
int isDrawingShape = 0;
int isDrawingLine = 0;
int isDrawingPencil = 0;

float startX, startY, endX, endY;
Shape currentShape;

// Function to draw a circle using OpenGL
void drawCircle(Point center, float radius) {
    // Drawing a circle using GL_LINE_LOOP
    int segments = 100;
    glBegin(GL_LINE_LOOP);
    for (int i = 0; i < segments; i++) {
        float theta = 2.0f * static_cast<float>(M_PI) * static_cast<float>(i) / static_cast<float>(segments);
        float x = radius * cosf(theta);
        float y = radius * sinf(theta);
        glVertex2f(static_cast<GLfloat>(center.x + x), static_cast<GLfloat>(center.y + y));
    }
    glEnd();
}

// Function to convert a line shape to a circle shape
Shape convertLineToCircle(Shape lineShape) {
    // Logic to convert a line shape to a circle shape
    float lineLength = sqrtf(powf(lineShape.end.x - lineShape.start.x, 2) + powf(lineShape.end.y - lineShape.start.y, 2));
    float circleRadius = lineLength / 2.0f;

    float centerX = (lineShape.start.x + lineShape.end.x) / 2.0f;
    float centerY = (lineShape.start.y + lineShape.end.y) / 2.0f;

    Shape circleShape;
    circleShape.start.x = centerX - circleRadius;
    circleShape.start.y = centerY - circleRadius;
    circleShape.end.x = centerX + circleRadius;
    circleShape.end.y = centerY + circleRadius;
    circleShape.type = CIRCLE;
    circleShape.r = lineShape.r;
    circleShape.g = lineShape.g;
    circleShape.b = lineShape.b;
    circleShape.thickness = lineShape.thickness;
    circleShape.isFilled = 0;

    return circleShape;
}

// Function to convert a line shape to a rectangle shape
Shape convertLineToRectangle(Shape drawnShape) {
    // Logic to convert a line shape to a rectangle shape
    float width = fabsf(drawnShape.start.x - drawnShape.end.x);
    float height = fabsf(drawnShape.start.y - drawnShape.end.y);

    float minWidth = 5.0f;
    float minHeight = 10.0f;

    if (width < minWidth) {
        width = minWidth;
    }
    if (height < minHeight) {
        height = minHeight;
    }

    drawnShape.end.x = drawnShape.start.x + width;
    drawnShape.end.y = drawnShape.start.y + height;
    drawnShape.type = RECTANGLE;

    return drawnShape;
}

// Function to draw a specific shape using OpenGL
void drawShape(Shape shape) {
    // Drawing different shapes using OpenGL based on their types
    glColor3f(shape.r, shape.g, shape.b);
    glLineWidth(shape.thickness);

    if (shape.type == LINE) {
        glBegin(GL_LINES);
        glVertex2f(shape.start.x, shape.start.y);
        glVertex2f(shape.end.x, shape.end.y);
        glEnd();
    }
    else if (shape.type == RECTANGLE) {
        if (shape.isFilled) {
            glColor3f(shape.r, shape.g, shape.b);
            glBegin(GL_QUADS);
            glVertex2f(shape.start.x, shape.start.y);
            glVertex2f(shape.end.x, shape.start.y);
            glVertex2f(shape.end.x, shape.end.y);
            glVertex2f(shape.start.x, shape.end.y);
            glEnd();
        }
        else {
            glColor3f(shape.r, shape.g, shape.b);
            glBegin(GL_LINE_LOOP);
            glVertex2f(shape.start.x, shape.start.y);
            glVertex2f(shape.end.x, shape.start.y);
            glVertex2f(shape.end.x, shape.end.y);
            glVertex2f(shape.start.x, shape.end.y);
            glEnd();
        }
    }
    else if (shape.type == CIRCLE) {
        float radius = fminf(fabsf(shape.end.x - shape.start.x), fabsf(shape.end.y - shape.start.y)) / 2.0f;
        Point center = { (shape.start.x + shape.end.x) / 2.0f, (shape.start.y + shape.end.y) / 2.0f };
        drawCircle(center, radius);
    }
    else if (shape.type == TRIANGLE) {
        glBegin(GL_LINE_LOOP);
        glVertex2f(shape.start.x, shape.start.y + (shape.end.y - shape.start.y));
        glVertex2f(shape.start.x + (shape.end.x - shape.start.x) / 2, shape.start.y);
        glVertex2f(shape.end.x, shape.start.y + (shape.end.y - shape.start.y));
        glEnd();
    }
    else if (shape.type == SQUARE) {
        glBegin(GL_LINE_LOOP);
        glVertex2f(shape.start.x, shape.start.y);
        glVertex2f(shape.end.x, shape.start.y);
        glVertex2f(shape.end.x, shape.end.y);
        glVertex2f(shape.start.x, shape.end.y);
        glEnd();
    }
    else if (shape.type == ELLIPSE) {
        if (shape.isFilled) {
            glColor3f(shape.r, shape.g, shape.b);
            float radiusX = fabs(shape.end.x - shape.start.x) / 2;
            float radiusY = fabs(shape.end.y - shape.start.y) / 2;
            Point center = { (shape.start.x + shape.end.x) / 2, (shape.start.y + shape.end.y) / 2 };

            glBegin(GL_TRIANGLE_FAN);
            glVertex2f(center.x, center.y);
            for (int i = 0; i <= 360; i++) {
                float rad = i * M_PI / 180;
                glVertex2f(center.x + cos(rad) * radiusX, center.y + sin(rad) * radiusY);
            }
            glEnd();
        }
        else {
            glColor3f(shape.r, shape.g, shape.b);
            float radiusX = fabs(shape.end.x - shape.start.x) / 2;
            float radiusY = fabs(shape.end.y - shape.start.y) / 2;
            Point center = { (shape.start.x + shape.end.x) / 2, (shape.start.y + shape.end.y) / 2 };

            glBegin(GL_LINE_LOOP);
            for (int i = 0; i < 360; i++) {
                float rad = i * M_PI / 180;
                glVertex2f(center.x + cos(rad) * radiusX, center.y + sin(rad) * radiusY);
            }
            glEnd();
        }
    }
}

// Function to draw a pencil stroke
void drawPencilStroke(int x, int y) {
    // Drawing a pencil stroke at the specified coordinates
    glPointSize(lineThickness);
    glColor3f(red, green, blue);
    glBegin(GL_POINTS);
    glVertex2f(x, y);
    glEnd();
    glutPostRedisplay();
}

// Function to add a shape to the shapes list
void addShapeToList(Shape shape) {
    // Adding a shape to the shapes list if space is available
    if (shapesCount < MAX_SHAPES) {
        shapes[shapesCount++] = shape;
    }
    else {
        printf("Shape limit reached!");
    }
}

// Function to remove a shape from the shapes list at a specific index
void removeShape(int index) {
    // Removing a shape from the shapes list at the specified index
    if (index >= 0 && index < shapesCount) {
        for (int i = index; i < shapesCount - 1; ++i) {
            shapes[i] = shapes[i + 1];
        }
        shapesCount--;
    }
}

// Function to detect and classify a drawn shape
Shape detectShape(Shape drawnShape) {
    // Detecting and classifying the drawn shape (e.g., rectangle, square)
    float width = fabs(drawnShape.start.x - drawnShape.end.x);
    float height = fabs(drawnShape.start.y - drawnShape.end.y);

    float aspectRatio = width / height;

    if (aspectRatio >= 0.9 && aspectRatio <= 1.1) {
        if (fabs(width - height) < 10.0) {
            drawnShape.type = SQUARE;
        }
        else {
            drawnShape.type = RECTANGLE;
        }
    }

    if (drawnShape.type == LINE) {
        drawnShape = convertLineToRectangle(drawnShape);
    }

    return drawnShape;
}

// Callback function for mouse click events
void mouseClick(int button, int state, int x, int y) {
    // Handling mouse click events (e.g., drawing shapes, removing shapes)
    if (button == GLUT_LEFT_BUTTON && state == GLUT_DOWN) {
        startX = x - 250;
        startY = 250 - y;
        isMouseDragging = 1;

        currentShape.start.x = startX;
        currentShape.start.y = startY;
        currentShape.end.x = startX;
        currentShape.end.y = startY;

        currentShape.r = red;
        currentShape.g = green;
        currentShape.b = blue;
        currentShape.type = currentShapeType;
        currentShape.thickness = lineThickness;
        currentShape.isFilled = 0;

        isDrawingShape = 1;
    }
    else if (button == GLUT_LEFT_BUTTON && state == GLUT_UP && isDrawingShape) {
        endX = x - 250;
        endY = 250 - y;

        currentShape.end.x = endX;
        currentShape.end.y = endY;

        addShapeToList(currentShape);

        isMouseDragging = 0;
        isDrawingShape = 0;
    }
    else if (button == GLUT_RIGHT_BUTTON && state == GLUT_DOWN) {
        int mouseX = x - 250;
        int mouseY = 250 - y;

        for (int i = shapesCount - 1; i >= 0; --i) {
            Shape shape = shapes[i];
            if (mouseX >= shape.start.x && mouseX <= shape.end.x && mouseY >= shape.start.y && mouseY <= shape.end.y) {
                removeShape(i);
                break;
            }
        }
    }
}

// Callback function for mouse movement events
void mouseMove(int x, int y) {
    // Handling mouse movement events (e.g., drawing lines, pencil strokes)
    if (isDrawingLine) {
        endX = x - 250;
        endY = 250 - y;
        glutPostRedisplay();
    }

    if (isDrawingPencil) {
        int currentX = x - 250;
        int currentY = 250 - y;
        drawPencilStroke(currentX, currentY);
        glutPostRedisplay();
    }
}

// Callback function for window reshaping
void reshape(int width, int height) {
    // Reshaping the window and setting up the projection matrix
    glViewport(0, 0, width, height);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluOrtho2D(-250, 250, -250, 250);
}

// Function to pop a shape from the undo stack
Shape popFromUndoStack() {
    // Popping a shape from the undo stack if available
    if (undoCount > 0) {
        return undoStack[--undoCount];
    }
    else {
        printf("Undo stack is empty!");
        Shape emptyShape = { 0 };
        return emptyShape;
    }
}

// Callback function for keyboard events
void keyboard(unsigned char key, int x, int y) {
    // Handling keyboard events (e.g., changing colors, shapes, undoing actions)
    switch (key) {
    case 'u':
    {
        Shape lastAction = popFromUndoStack();
        if (lastAction.type != 0) {
            addShapeToList(lastAction);
        }
    }
    break;
    case 'p':
        isDrawingLine = 0;
        isDrawingPencil = 1;
        break;
    case 'x':
        red = 0.0; green = 0.0; blue = 0.0; break;
    case 'z':
        red = 1.0; green = 1.0; blue = 1.0; break;
    case 'r':
        red = 1.0; green = 0.0; blue = 0.0; break;
    case 'g':
        red = 0.0; green = 1.0; blue = 0.0; break;
    case 'b':
        red = 0.0; green = 0.0; blue = 1.0; break;
    case '1':
        currentShapeType = LINE; break;
    case '2':
        currentShapeType = RECTANGLE; break;
    case '3':
        currentShapeType = CIRCLE; break;
    case '4':
        currentShapeType = TRIANGLE; break;
    case '5':
        currentShapeType = SQUARE; break;
    case '6':
        currentShapeType = ELLIPSE; break;
    case 'q':
        bgRed = 1.0; bgGreen = 1.0; bgBlue = 1.0; break;
    case 'w':
        bgRed = 1.0; bgGreen = 0.0; bgBlue = 0.0; break;
        break;
    case 'e':
        bgRed = 0.0; bgGreen = 0.0; bgBlue = 1.0; break;
        break;
    case 't':
        bgRed = 0.0; bgGreen = 1.0; bgBlue = 0.0; break;
        break;
    case '+':
        lineThickness += 1.0;
        break;
    case '-':
        if (lineThickness > 1.0) {
            lineThickness -= 1.0;
        }
        break;
    case 'c':
        shapesCount = 0;
        break;
    case 27:
        exit(0);
        break;
    }

    glutPostRedisplay();
}

// Callback function to display content on the window
void display() {
    // Clearing the screen and setting background color
    // Drawing shapes stored in the shapes list and the current shape being drawn
    glClear(GL_COLOR_BUFFER_BIT);
    glColor3f(bgRed, bgGreen, bgBlue);
    glBegin(GL_QUADS);
    glVertex2f(-250, -250);
    glVertex2f(250, -250);
    glVertex2f(250, 250);
    glVertex2f(-250, 250);
    glEnd();

    // Draw shapes
    for (int i = 0; i < shapesCount; ++i) {
        drawShape(shapes[i]);
    }

    // Draw current shape
    if (isDrawingShape) {
        drawShape(currentShape);
    }

    glutSwapBuffers();
}

// Main function
int main(int argc, char** argv) {
    // Initializing GLUT and creating a window
    // Setting up various callbacks for handling events
    // Starting the main loop for the application
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGB);
    glutInitWindowSize(500, 500);
    glutCreateWindow("Simple Paint");

    glClearColor(1.0, 1.0, 1.0, 1.0);

    glutDisplayFunc(display);
    glutReshapeFunc(reshape);
    glutMouseFunc(mouseClick);
    glutMotionFunc(mouseMove);
    glutKeyboardFunc(keyboard);

    glutMainLoop();
    return 0;
}
