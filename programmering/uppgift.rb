#beskriving: En funktion som tar en array med heltal eller flyttal som argument och returnerar medelvärdet av talen
#argument 1: array - en array med olika element. kan var vilket element som helst men fungerar bara med string, integer och float
#return: integer/float - returnerar medelvärdet av talen i argument 1/arrayen. blir klassen heltal/integer eller flyttal/float
#exempel:
# sum([1, 2, 3, 4, 5]) # => 3.0
# sum([1, 2, 3.5, 4.5, 5]) # => 3.2
# sum([0,1]) # => 0.5
# sum(["x",1]) # => 0.5
# sum(["x","6"]) # => 3.0
# sum(["5","10", 3]) # => 6.0
# sum([0,0]) # => 0.0
# sum([15,15,15,15,15]) # => 15.0
# sum([1.3, 1.6, 2.8, 6,8, 3, 5, 3,2 ,8]) # => 4.07
# sum([[2, 9],10, 3]) # => crash
# sum([false,10, 3]) # => crash

#datum: 2024-04-26
#namn: Arne Palmberg
def sum(array)

    i = 0
    sum = 0
    while i < array.length

        array[i] = array[i].to_f
        sum = sum + array[i]
        i += 1
    end

    return (sum / array.length)

end