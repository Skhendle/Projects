

def nextSmallestNumber(array, num):
    if num in array:
        return num
    elif num -1 > 0:
        return nextSmallestNumber(array, num-1)
    else:
        return -1


if __name__ == "__main__":
    a = [3, 4, 6, 9, 10, 12, 14, 15, 17, 19, 21]
    # Should return 12
    print(nextSmallestNumber(a, 12))
    print(nextSmallestNumber(a, 13))
    # Should return 6
    print(nextSmallestNumber(a, 8))
    # Should return -1
    print(nextSmallestNumber(a, -8))
    # Should return 21
    print(nextSmallestNumber(a, 80))