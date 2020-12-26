import cv2
import matplotlib.pyplot as plt

def readimage(arg):
    img = cv2.imread(arg)
    img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
    return img
 #BGR to RGB
#Bilateral filter is a Non linear filter prevents averaging across image edges, while averaging within smooth regions of the image,
# and so is edge-preserving, while Gaussian Filter is not.

def contours(image):
    img_blur = cv2.bilateralFilter(image, d = 7,
                                   sigmaSpace = 75, sigmaColor =75)
    # Convert to grayscale
    #cv2.imshow('img', image)
    img_gray = cv2.cvtColor(img_blur, cv2.COLOR_RGB2GRAY)
    # Apply the thresholding
    a = img_gray.max()
    _, thresh = cv2.threshold(img_gray, a/2+60, a,cv2.THRESH_BINARY_INV)

    contours, hierarchy = cv2.findContours(
                                       image = thresh,
                                       mode = cv2.RETR_TREE,
                                       method = cv2.CHAIN_APPROX_SIMPLE)

    contours = sorted(contours, key = cv2.contourArea, reverse = True)

    c_0 = contours[1]
    # Obtaining the 4 points of the bounding rectangle
    # x, y, w, h = cv2.boundingRect(c_0)
    # img_copy2 = image.copy()
    # img_box = cv2.rectangle(img_copy2, (x, y), (x+w, y+h), color = (0, 255, 0), thickness = 6)
    return c_0

if __name__ == '__main__':
  from sys import argv
  if len(argv) < 2:
      print ("Usage: python %s <image>" % argv[0])
      exit()
  img = readimage(argv[1])
  x,y,w,h,contour_img = contours(img)
#Region of Interest - only the business card area is selected
  roi = img[y:y+h, x:x+w]
  # cv2.imwrite("roi.png", roi)

  plt.subplot(1, 2, 1)
  plt.imshow(img)
  plt.axis('off')
  plt.title('Original')

  plt.subplot(1, 2, 2)
  plt.imshow(contour_img)
  plt.axis('off')
  plt.title('Contour Image')

  plt.show()
