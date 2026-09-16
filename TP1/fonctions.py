def puissance(a, b):
    if not type(a) is int or not type(b) is int:
        raise TypeError("Only integers are allowed")

    if a == 0 and b == 0:
        raise ValueError("0 puissance 0 est indéfini")

    res = 1

    if b >= 0:
        for i in range(b):
            res = res * a
    else:
        for i in range(-b):
            res = res * a
        res = 1 / res

    return res
