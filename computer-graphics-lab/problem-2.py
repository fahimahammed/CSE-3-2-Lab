import matplotlib.pyplot as plt
import numpy as np

def calcCurvePoint(controlPoints, numOfPoints):
    t = np.linspace(0, 1, numOfPoints)
    n = len(controlPoints) - 1
    curvePoints = np.zeros((numOfPoints, 2))

    for i in range(numOfPoints):
        for j in range(n + 1):
            curvePoints[i] += controlPoints[j] * coefficient(n, j) * (1 - t[i]) ** (n - j) * t[i] ** j

    return curvePoints

def coefficient(n, k):
    return np.math.factorial(n) / (np.math.factorial(k) * np.math.factorial(n-k))



controlPoints = np.array([[0, 0], [2, 5], [5, 3]])
numOfPoints = 100
curvePoints = calcCurvePoint(controlPoints, numOfPoints)

plt.plot(controlPoints[:, 0], controlPoints[:, 1], 'go-')
plt.plot(curvePoints[:, 0], curvePoints[:, 1], 'r-')
plt.legend()
plt.title("Bezier Curve")

plt.tight_layout()
plt.show()