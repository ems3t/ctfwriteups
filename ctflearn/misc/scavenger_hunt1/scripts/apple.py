a = "Take every 15th letter To construct a URL It has to be very small I hope that you can tell Pay attention along the way The journey commences here I left some clues behind As I will soon disappear So the last thing I recommend Is to remove the K at the very very end Good luck!"
a = a.replace("15", "")
a = a.replace("!", "")
a = a.replace(" ", "")
print a[14::15]