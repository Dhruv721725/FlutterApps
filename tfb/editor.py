import pyautogui as ptg

file= open (r"D:\club\wsa.txt.txt","r")
l=file.readlines()
l.sort()
ptg.countdown(3)
print(len(l))
for i in l:
    print(i[:-1])
    ptg.keyDown("ctrl")
    ptg.keyDown("a")
    ptg.keyUp("ctrl")
    ptg.keyUp("a")
    
    ptg.write(i[:-1])
    
    ptg.keyDown("ctrl")
    ptg.keyDown("p")
    ptg.keyUp("ctrl")
    ptg.keyUp("p")
    
    ptg.countdown(2)
    
    ptg.keyDown("return")
    ptg.keyUp("return")
    
    ptg.countdown(2)
    
    ptg.write(i[:-1])
    
    ptg.countdown(2)
    
    ptg.keyDown("return")
    ptg.keyUp("return")
    
    ptg.countdown(2)
file.close()
    