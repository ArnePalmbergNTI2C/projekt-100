def set_up()
    puts "spelare 1 namn:"
    player1 = gets.chomp

    puts "spelare 2 namn:"
    player2 = gets.chomp

    puts "vill du veta hur man spelar spelet skriv: ja"
    input = gets.chomp.downcase
    if input == "ja"
        system("cls")
        puts "Här finns regler"
        puts "rule 1: susssy"
        puts ""
        puts ""
        puts "vill du stänga ner reglerna skriv: ja"
        input = gets.chomp.downcase
        while input != "ja"
            puts "skriv ja"
            input = gets.chomp.downcase
        end    
    end

    pinnar = rand(13..18)

    vems_tur = rand(1..2)

    return player1,player2,pinnar,vems_tur
end

def set_up_multible_stacks()
    puts "Hur många högar med pinnar vill du ha, svara med ett tal från 1 till 5"
    input = gets.chomp.to_i
    while input < 1 || input > 5
        puts "skriv ett tal från 2 till 5"

        input = gets.chomp.to_i
    end

    antal_hog = input

    system("cls")
    
    puts "spelare 1 namn:"
    player1 = gets.chomp

    puts "spelare 2 namn:"
    player2 = gets.chomp

    puts "vill du veta hur man spelar spelet skriv: ja"
    input = gets.chomp.downcase
    if input == "ja"
        system("cls")
        puts "Här finns regler"
        puts "rule 1: susssy"
        puts ""
        puts ""
        puts "vill du stänga ner reglerna skriv: ja"
        input = gets.chomp.downcase
        while input != "ja"
            puts "skriv ja"
            input = gets.chomp.downcase
        end    
    end

    pinnar = make_stacks(antal_hog)

    vems_tur = rand(1..2)

    return player1,player2,pinnar,vems_tur
end

# Beskrivning: make_stacks funktionen gör en array som ska föreställa flera högar av pinnar. Hur många högar som gör beror på första argumentet. Hur många pinnar det är i varje hög slumpas från 13 till 18
# Argument 1: integer antal_hog => analet högar som ska skapas
# Return: Array pinnar => alla högar med slumpvis antal pinnar
# Exempel 1: make_stacks(2) => [rand(13..18), rand(13..18)]
# Exempel 2: make_stacks(5) => [rand(13..18), rand(13..18), rand(13..18), rand(13..18), rand(13..18)]
# Datum: 2024-05-12
# Namn: Noah Törngren, Arne Palmberg
def make_stacks(antal_hog)
    pinnar = []

    i = 0
    while i < antal_hog
        randint = rand(13..18)

        pinnar << randint

        i += 1
    end

    return pinnar
end

def play(player1,player2,pinnar,vems_tur)

    while pinnar > 0 
        system("cls")
        display_pinnar(pinnar)


        if vems_tur % 2 == 0
            puts "#{player2} välj hur många pinnar som ska tas bort"
            antal = gets.chomp.to_i
            valid = false
            while valid == false
                valid = true
                if antal > 3 || antal < 1
                    valid = false
                    puts "välj igen. välj ett tal mellan 1-3"
                    antal = gets.chomp.to_i
                elsif antal.class != Integer
                    valid = false
                    puts "välj igen. måste vara ett heltal"
                    antal = gets.chomp
                end
                
            end

            pinnar -= antal
            display_pinnar(pinnar)

        else
            puts "#{player1}. välj hur många pinnar som ska tas bort"
            antal = gets.chomp.to_i
            valid = false
            while valid == false
                valid = true
                if antal > 3 || antal < 1
                    valid = false
                    puts "välj igen. välj ett tal mellan 1-3"
                    antal = gets.chomp.to_i
                elsif antal.class != Integer
                    valid = false
                    puts "välj igen. måste vara ett heltal"
                    antal = gets.chomp
                end
                
            end

            pinnar -= antal
            display_pinnar(pinnar)

        end
        
        vems_tur += 1

    end
    return vems_tur 

end

def pinnar_left(pinnar)
    i = 0
    left = 0
    while i < pinnar.length
        left += pinnar[i]

        i += 1
    end
    return left
end

# Beskrivning: display_multitible_stacks funktionen demonstrerar hur många pinnar som finns kvar i varje hög. Hur många pinnar som finns kvar ritas ut på skärmen
# Argument 1: array pinnar => en array med antalet pinnar i varje hög
# Return: nil => inget retuneras, bara skrivs ut på skärmen
# Exempel 1: display_multible_stacks([1,3,5]) => nil, dock skrivs detta ut på skärmen: "|""/n""|||""/n""|||||"
# Exempel 2: display_multible_stacks([2,0,2,6]) => nil, dock skrivs detta ut på skärmen: "||"/n""/n""||""/n"||||||"
def display_multible_stacks(pinnar)
    i = 0

    while i < pinnar.length
        output = ""
        j = 0
        while j < pinnar[i]
            output << "| "
            j += 1
        end

        puts output
        i += 1
    end
end

def play_multible_stacks(player1,player2,pinnar,vems_tur)
    
    while pinnar_left(pinnar) > 0 
        system("cls")
        display_multible_stacks(pinnar)

        if vems_tur % 2 == 0
            puts "#{player2} välj hög"
            hog = gets.chomp.to_i
            valid = false
            while valid == false
                valid = true
                if hog > pinnar.length || hog < 1
                    valid = false
                    puts "välj igen. välj ett tal mellan 1-3"
                    hog = gets.chomp.to_i
                elsif hog.class != Integer
                    valid = false
                    puts "välj igen. måste vara ett heltal"
                    hog = gets.chomp.to_i
                elsif pinnar[hog-1] < 1
                    puts "Välj en hög med pinnar"
                end
                
            end
            
            puts "#{player2} välj antal, 1-3"
            antal = gets.chomp.to_i
            valid = false 
            while valid == false
                valid = true
                if antal < 1 || antal > 3
                    valid = false
                    puts "välj ett heltal mellan från 1 till 3"
                    antal = gets.chomp.to_i

                elsif antal.class != Integer
                    valid = false
                    puts "välj igen. Måste vara ett heltal"
                    antal = gets.chomp.to_i
                end
            end

            pinnar[hog-1] -= antal
            if pinnar[hog-1] < 1
                pinnar[hog-1] = 0
            end
            display_multible_stacks(pinnar)

        else
            puts "#{player1} välj hög"
            hog = gets.chomp.to_i
            valid = false
            while valid == false
                valid = true
                if hog > pinnar.length || hog < 1
                    valid = false
                    puts "välj igen. välj ett tal mellan 1-3"
                    hog = gets.chomp.to_i
                elsif hog.class != Integer
                    valid = false
                    puts "välj igen. måste vara ett heltal"
                    hog = gets.chomp.to_i
                elsif pinnar[hog-1] < 1
                    puts "Välj en hög med pinnar"
                end
                
            end
            
            puts "#{player1} välj antal, 1-3"
            antal = gets.chomp.to_i
            valid = false 
            while valid == false
                valid = true
                if antal < 1 || antal > 3
                    valid = false
                    puts "välj ett heltal mellan från 1 till 3"
                    antal = gets.chomp.to_i

                elsif antal.class != Integer
                    valid = false
                    puts "välj igen. Måste vara ett heltal"
                    antal = gets.chomp.to_i
                end
            end

            pinnar[hog-1] -= antal
            if pinnar[hog-1] < 1
                pinnar[hog-1] = 0
            end
            display_multible_stacks(pinnar)

        end

        vems_tur +=1

    end

    return vems_tur
end

def game_over(winner,player1,player2)
    system("cls")

    if winner % 2 == 0
        puts "#{player2} vann"
    else
        puts "#{player1} vann"
    end

end

def multible_stacks()
    result = false

    puts "skriv 1 om du vill ha flera högar av pinnar, annars tryck enter"
    input = gets.chomp.downcase
    if input == "1"
        result = true
    end
    return result
end

def game()

    system("cls")

    if multible_stacks() == true
        player1,player2,pinnar,vems_tur = set_up_multible_stacks()
        winner = play_multible_stacks(player1,player2,pinnar,vems_tur)
    else
        player1,player2,pinnar,vems_tur = set_up()
        winner = play(player1,player2,pinnar,vems_tur)
    end
    

    game_over(winner,player1,player2)

    puts "vill du köra igen skriv: ja"
    input = gets.chomp.downcase
    if input == "ja"
        game()
    end

end

def display_pinnar(pinnar)
    output = ""
    i = 0

    while i < pinnar
        output << "| "

        i +=1
    end
    puts "antal pinnar kvar:"
    return output
end

game()