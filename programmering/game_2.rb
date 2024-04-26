def set_up()
    puts "vill du spela mot en bott eller en annan spelare, skriv 1 för bott, skriv 2 för annan spelare"
    input = gets.chomp
    p input
    while input != "1" && input != "2"
        puts "skriv 1 eller 2"
        input = gets.chomp
    end  

    bot = false

    if input == "1"
        puts "spelare namn"
        player = gets.chomp
        bot = true
    else
        puts "spelare 1 namn:"
        player1 = gets.chomp

        puts "spelare 2 namn:"
        player2 = gets.chomp
    end

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

    
    return player1,player2,pinnar,vems_tur, bot,player
    
    

end

def play_bot(player, pinnar,vems_tur)
    while pinnar > 0 
        system("cls")
        puts display_pinnar(pinnar)


        if vems_tur % 2 == 0
            # bots tur
            puts "botten bestämmer sig"
            sleep(2)
            antal = rand(1..3)
            
            

            pinnar -= antal
            puts display_pinnar(pinnar)

        else
            puts "#{player}. välj hur många pinnar som ska tas bort"
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
            puts display_pinnar(pinnar)

        end
        
        vems_tur += 1

    end
    
    return vems_tur
end

def play(player1,player2,pinnar,vems_tur)

    while pinnar > 0 
        system("cls")
        puts display_pinnar(pinnar)


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
            puts display_pinnar(pinnar)

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
            puts display_pinnar(pinnar)

        end
        
        vems_tur += 1

    end
    return vems_tur 

end

def game_over(winner,player1,player2, player, bot)
    system("cls")

    if bot == true
        if winner % 2 == 0
            puts "botten vann"
        else
            puts "#{player} vann"
        end
    else 
        if winner % 2 == 0
            puts "#{player2} vann"
        else
            puts "#{player1} vann"
        end
    end

end

def game()

    system("cls")
    
    player1,player2,pinnar,vems_tur, bot,player = set_up()

    p bot
    if bot == false
        winner = play(player1,player2,pinnar,vems_tur)
    else
        puts "bot vald"
        winner = play_bot(player, pinnar,vems_tur)
    end

    game_over(winner,player1,player2, player, bot)

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