import io

file = io.open("garbage.txt")
if file:
    buffer = file.read()
    print(buffer)
    file.close()
