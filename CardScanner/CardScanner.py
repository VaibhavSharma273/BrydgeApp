import TextRecognition2
import cv2
from matplotlib import pyplot as plt

if __name__ == '__main__':
  from sys import argv
  if len(argv) < 2:
      print ("Usage: python %s <image>" % argv[0])
      exit()

 # img = readimage(argv[1])
  img = cv2.imread(argv[1])
  img2, text_arrays, text = TextRecognition2.TextRecognition(img)
  print(text)
  
  # cv2.imshow('img', img2)
  # cv2.waitKey(0)
  # plt.gray()
  for elem in text_arrays:
        print (elem)

  plt.subplot(1, 1, 1)
  plt.imshow(img2)
  plt.axis('off')
  plt.title('Detect')

  plt.show()
