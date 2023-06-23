import numpy as np
import matplotlib.pyplot as plt
import math

rAngle = 0
xPoint = 0
yPoint = 0

#polygonPoints = np.array([[1, 1], [1, 4],[4, 4], [4, 1], [1, 1]])

polygonPoints = np.array([[-2, -2], [2, -2], [2, 2], [-2, -2]])

print("Select One: \n1.Translation \n2.Rotation \n3.Scaling")
p = input("Enter a number: ")

plt.figure(figsize=(10, 5))
plt.subplot(121)
plt.plot(polygonPoints[:, 0], polygonPoints[:, 1], 'ro-')
plt.title('Original Shape')
plt.xlim(-10, 10)
plt.ylim(-10, 10)
plt.grid(True)
plt.gca().set_aspect('equal', adjustable='box')

if p == '1':
    print("Translation")
    rAngle = input("Enter the value of x to Translate: ")
    yPoint = input("Enter the value of y to Translate: ")
    tPolygonPoints = polygonPoints + np.array([int(xPoint), int(yPoint)])
    plt.subplot(122)
    plt.plot(tPolygonPoints[:, 0], tPolygonPoints[:, 1], 'go-')
    plt.title('Translation')
    plt.xlim(-10, 10)
    plt.ylim(-10, 10)
    plt.grid(True)
    plt.gca().set_aspect('equal', adjustable='box')

elif p == '2':
    print("Rotation")
    rAngle = input("Enter the value of Rotation angle: ")

    angle = math.radians(int(rAngle))
    rMatrix = np.array([[math.cos(angle), -math.sin(angle)], [math.sin(angle), math.cos(angle)]])
    rPolygonPoints = np.dot( polygonPoints, rMatrix)
    plt.subplot(122)
    plt.plot(rPolygonPoints[:, 0], rPolygonPoints[:, 1], 'bo-')
    plt.title('Rotation')
    plt.xlim(-10, 10)
    plt.ylim(-10, 10)
    plt.grid(True)
    plt.gca().set_aspect('equal', adjustable='box')

elif p == '3':
    print("Scaling")
    xPoint = input("Enter the value of x to Translate: ")
    yPoint = input("Enter the value of y to Translate: ")
    sPolygonPoints = polygonPoints * np.array([int(xPoint), int(yPoint)])
    plt.subplot(122)
    plt.plot(sPolygonPoints[:, 0], sPolygonPoints[:, 1], 'go-')
    plt.title('Translation')
    plt.xlim(-10, 10)
    plt.ylim(-10, 10)
    plt.gca().set_aspect('equal', adjustable='box')
    print(xPoint, yPoint)
else:
    print("Wrong Input")


plt.tight_layout()
plt.show()