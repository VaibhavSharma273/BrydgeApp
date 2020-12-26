#importing necessary libraries
import numpy as np
import cv2
import imutils
#import pytesseract

from skimage import exposure
from matplotlib import pyplot as plt
from numpy.fft import fft2, ifft2
from PIL import Image
from Gaussian_Blur import gaussian
from Contours import contours, readimage

# Perspective Transformation Function
def Perspective(im):
    screenCnt = contours(im)
    contour = cv2.drawContours(im.copy(), [screenCnt], -1, (0, 255, 0), 3)
    # Draws the contour onto the image
    pts = screenCnt.reshape(len(screenCnt),2)
    # Reshapes the contour array to a list of x-y points
    rect = np.zeros((4, 2), dtype = "float32")
    # Creates our rectangle; rest is just determining the points
    s = pts.sum(axis = 1)
    rect[0] = pts[np.argmin(s)]
    rect[2] = pts[np.argmax(s)]
    diff = np.diff(pts, axis = 1)
    rect[1] = pts[np.argmin(diff)]
    rect[3] = pts[np.argmax(diff)]

    (tl, tr, br, bl) = rect
    widthA = np.sqrt(((br[0] - bl[0]) ** 2) + ((br[1] - bl[1]) ** 2))
    widthB = np.sqrt(((tr[0] - tl[0]) ** 2) + ((tr[1] - tl[1]) ** 2))

    heightA = np.sqrt(((tr[0] - br[0]) ** 2) + ((tr[1] - br[1]) ** 2))
    heightB = np.sqrt(((tl[0] - bl[0]) ** 2) + ((tl[1] - bl[1]) ** 2))

    maxWidth = max(int(widthA), int(widthB))
    maxHeight = max(int(heightA), int(heightB))

    dst = np.array([[0, 0],[maxWidth - 1, 0],[maxWidth - 1, maxHeight - 1],[0, maxHeight - 1]], dtype = "float32")

    # Carries out the actual 4-point perspective transformation
    M = cv2.getPerspectiveTransform(rect, dst)
    warp = cv2.warpPerspective(im, M, (maxWidth, maxHeight))
    # cv2.imshow('xyz', warp)
    # cv2.waitKey(0)
    # Adjusts the exposure of the image
    #warp = exposure.rescale_intensity(warp, out_range = (0, 255))

    return contour, warp
