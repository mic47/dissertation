import sys
from matplotlib import pyplot as plt
import math
from numpy import *

x = int(sys.argv[1])

dnkd = dict()

def fak(n):
    if n <= 1: return 1
    return n * fak(n-1)

def dnk(n, k):
    key = (n, k)
    if key in dnkd: 
        return dnkd[key]
    if n == k:
        ret = fak(n)
    elif n < k or k < 2:
        ret = 0
    else:
        ret = (k - 1) * dnk(n - 1, k) + k * dnk(n - 1, k - 1)
    dnkd[key] = ret
    return ret
Z=[]
for n in range(x + 1):
    Z.append([])
    for k in range(x + 1):
        xx = dnk(n, k)
        if xx == 0:
            Z[-1].append(float('-inf'))
        else:
            Z[-1].append(int(math.log(xx)))


print Z
