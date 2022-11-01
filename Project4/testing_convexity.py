#!/usr/bin/python3.10
import numpy as np
from math import pi

def random_symmetric(n: int, mean: float = 0, var: float = 1) -> np.ndarray:
    A = np.random.normal(mean, var, (n,n))
    return A + A.T

def random_vectors(n: int, mean: float = 0, var: float = 1) -> np.ndarray:
    return np.random.normal(mean, var, n)

def get(a: list, i: int, default):
    ret_type = type(default)
    return default if i >= len(a) or i < 0 else ret_type(a[i]);
 
def test(z1: np.ndarray, z2: np.ndarray, BIG: np.ndarray) -> bool:
    bar_z1 = BIG @ z1
    bar_z2 = BIG @ z2
    return bar_z1 @ (z2 - z1) <= bar_z2 @ (z2 - z1)

def main(args: list[str]):
    maxiter = get(args, 1, default = 100)
    n =       get(args, 2, default = 2)
    mean =    get(args, 3, default = 0.0)
    var =     get(args, 4, default = 10.0)

    for _ in range(maxiter):
        big_matrix = random_symmetric(n,mean,var)
        z1 = random_vectors(n,mean,var)
        z2 = random_vectors(n,mean,var)
        assert(
            test(z1, z2, big_matrix),
            f"Found a counter-example:\n{z1}\n{z2}"
        )

if __name__ == "__main__":
    from sys import argv
    main(argv)
