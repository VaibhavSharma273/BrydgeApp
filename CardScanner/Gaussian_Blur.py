from PIL import Image
import matplotlib.pyplot as plt
import numpy as np
from numpy.fft import fft2, ifft2


def gaussian(img):
    b = np.array([[2, 4,  5,  2,  2],
               [4, 9,  12, 9,  4],
               [5, 12, 15, 12, 5],
               [4, 9,  12, 9,  4],
               [2, 4,  5,  4,  2]]) / 156;
    kernel = np.zeros(img.shape)
    kernel[:b.shape[0], :b.shape[1]] = b

    fim = fft2(img)
    fkernel = fft2(kernel)
    fil_im = ifft2(fim * fkernel)

    return np.abs(fil_im).astype(int)


if __name__ == "__main__":
    from sys import argv
    if len(argv) < 2:
        print("Usage: python %s <image>" % argv[0])
        exit()
    im = np.array(Image.open(argv[1]))
    im = im[:, :, 0]
    plt.gray()

    plt.subplot(1, 2, 1)
    plt.imshow(im)
    plt.axis('off')
    plt.title('Original')

    plt.subplot(1, 2, 2)
    plt.imshow(gaussian(im))
    plt.axis('off')
    plt.title('Filtered')

    plt.show()
