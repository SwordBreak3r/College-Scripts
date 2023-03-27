#This was one of the first scripts I ever wrote
#it was designed to let you know what percentage of a grade was worth in A,B,C or D.
#And handle the error if a decimal digit was not entered.




def compute_grade(x):
    
    if x > 1 :
        print (f"{x} is a invalid response, please use a number between 0 and 1.")
    if x < 0 :
        print (f"Wow, thats really bad.")
    if x < .5 :
        print (f"You got an F :(")
    if x >= .5 and x <= .6 :
        print (f"You got a D!")
    if x >= .6 and x <= .7 :
        print (f"you got a C!")
    if x >= .7 and x <= .8 :
        print (f"you got a B!")
    if x >= .8 and x <= .99 :
        print (f"you got a A")
    if x == 1 :
        print (f"Wow, you got a perfect score!")
    

runprogram = True

while runprogram == True:
    score_input = input(f"Enter score:") 
    if score_input == "done":
            print (f"goodbye!")
            runprogram = False
            exit()
    try: 
        float(score_input) 
        compute_grade(float(score_input))
    except ValueError:
        print (f"{score_input} is a invalid response.")
        
       
  