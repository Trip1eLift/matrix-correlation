import numpy as np

def corr_func(aa, bt, ct):
  Mat = np.matrix([
    [ 1, aa, bt],
    [aa,  1, ct],
    [bt, ct,  1]
  ])
  return np.corrcoef(Mat)

B = 10
# a = range(1, B)
# b = range(1, B)
# c = range(1, B)
f = 2 * B + 1


