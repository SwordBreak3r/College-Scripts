#This is a script we wrote later in the semester
#The goal was to take input from the user in the form of numbers
#It will then display statistics about the numbers that were entered.


totalnum = 0
counter = 0
average = 0 
runprogram = True
highest = 0
lowest = 0

while runprogram == True:
    try: 
        userinput = input(f"Enter a number: ")
        if float(userinput):
            counter += 1
            totalnum += float(userinput)
            average = (totalnum / counter)
            if counter == 1:
                highest = userinput
                lowest = userinput
            else:
                if float(userinput) > float(highest):
                    highest = userinput
                if float(userinput) <= float(lowest):
                    lowest = userinput

        
    except ValueError:
        if userinput == "done":
            print (f"Total: {totalnum}")
            print (f"Count: {counter}")
            print (f"Average: {average}")
            print (f"Highest: {highest}")
            print (f"Lowest: {lowest}")
            runprogram == False
            break
        else:
            print ("Invalid number entered!")