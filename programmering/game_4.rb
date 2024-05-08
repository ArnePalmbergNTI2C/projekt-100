def set_up()
    puts "vill du spela mot en bott eller en annan spelare, skriv 1 för bott, skriv 2 för annan spelare"
    input = gets.chomp
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

    puts "hur många högar"

    valid = false
    while valid == false
        input = gets.chomp.to_i
        if input = 2
            valid = true
            pinnar_var = 2
            pinnar_1 = rand(13..18)
            pinnar_2 = rand(13..18)
        elsif input = 3
            valid = true
            pinnar_var = 3
            pinnar_1 = rand(13..18)
            pinnar_2 = rand(13..18)
            pinnar_3 = rand(13..18)
        elsif input = 4
            valid = true
            pinnar_var = 4
            pinnar_1 = rand(13..18)
            pinnar_2 = rand(13..18)
            pinnar_3 = rand(13..18)
            pinnar_4 = rand(13..18)
        end
    end

    vems_tur = rand(1..2)
   
    return player1,player2,pinnar,pinnar_1, pinnar_2, pinnar_3, pinnar_4,vems_tur, bot,player, pinnar_var
    
end

def play_bot(player, pinnar,vems_tur)
    while pinnar > 0 
        system("cls")
        puts display_pinnar(pinnar)

        if vems_tur % 2 == 0
            # bots tur
            pinnar = bottens_tur(pinnar)
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

def play(player1,player2,pinnar_1, pinnar_2, pinnar_3, pinnar_4,vems_tur, pinnar_var)

    while pinnar_1 > 0 || pinnar_2 > 0 || pinnar_3 > 0 
        system("cls")
        
 puts display_pinnar_3(pinnar_var)

        
        if vems_tur % 2 == 0

            puts "#{player2} välj hög"
            hog = gets.chomp.to_i
            valid = false
            while valid == false
                valid = true
                if hog > 3 || hog < 1
                    valid = false
                    puts "välj igen. välj ett tal mellan 1-3"
                    hog = gets.chomp.to_i
                elsif hog.class != Integer
                    valid = false
                    puts "välj igen. måste vara ett heltal"
                    hog = gets.chomp
                elsif hog == 1 && pinnar_1 < 1
                    valid = false
                    puts "välj igen. tom hög"
                    hog = gets.chomp.to_i
                elsif hog == 2 && pinnar_2 < 1
                    valid = false
                    puts "välj igen. tom hög"
                    hog = gets.chomp.to_i
                elsif hog == 3 && pinnar_3 < 1
                    valid = false
                    puts "välj igen. tom hög"
                    hog = gets.chomp.to_i
                end
            end

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

            if hog == 1
                pinnar_1 -= antal
            elsif hog == 2
                pinnar_2 -= antal
            else
                pinnar_3 -= antal
            end
        else
            puts "#{player1} välj hög"
            hog = gets.chomp.to_i
            valid = false
            while valid == false
                valid = true
                if hog > 3 || hog < 1
                    valid = false
                    puts "välj igen. välj ett tal mellan 1-3"
                    hog = gets.chomp.to_i
                elsif hog.class != Integer
                    valid = false
                    puts "välj igen. måste vara ett heltal"
                    hog = gets.chomp
                elsif hog == 1 && pinnar_1 < 1
                    valid = false
                    puts "välj igen. tom hög"
                    hog = gets.chomp.to_i
                elsif hog == 2 && pinnar_2 < 1
                    valid = false
                    puts "välj igen. tom hög"
                    hog = gets.chomp.to_i
                elsif hog == 3 && pinnar_3 < 1
                    valid = false
                    puts "välj igen. tom hög"
                    hog = gets.chomp.to_i
                end
                
            end

            puts "#{player1} välj hur många pinnar som ska tas bort"
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

            if hog == 1
                pinnar_1 -= antal
            elsif hog == 2
                pinnar_2 -= antal
            else
                pinnar_3 -= antal
            end
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
    
    player1,player2,pinnar,pinnar_1, pinnar_2, pinnar_3 pinnar_4,vems_tur, bot,player, pinnar_var = set_up()

    if bot == false
        if pinnar_var == 2 
            winner = play(player1,player2,pinnar_1, pinnar_2, 0, 0,vems_tur, pinnar_var)
        elsif pinnar_var == 3
            winner = play(player1,player2,pinnar_1, pinnar_2, pinnar_3, 0,vems_tur, pinnar_var)
        elsif pinnar_var == 4
            winner = play(player1,player2,pinnar_1, pinnar_2, pinnar_3, pinnar_4,vems_tur, pinnar_var)
        end
    else
        winner = play_bot(player, pinnar,vems_tur)
    end

    game_over(winner,player1,player2, player, bot)

    puts "vill du köra igen skriv: ja"
    input = gets.chomp.downcase
    if input == "ja"
        game()
    end

end

def display_pinnar_2(pinnar_1,pinnar_2)
    output1 = ""
    output2 = ""

    i = 0 
    
    while i < pinnar_1
        output1 << "| "

        i +=1
    end
    i = 0
    while i < pinnar_2
        output2 << "| "

        i += 1
    end
    
    puts "antal pinnar kvar:"
    return output1, output2

end

def display_pinnar_3(pinnar_1,pinnar_2,pinnar_3)
    output1 = ""
    output2 = ""
    output3 = ""

    i = 0 
    
    while i < pinnar_1
        output1 << "| "

        i +=1
    end
    i = 0
    while i < pinnar_2
        output2 << "| "

        i += 1
    end
    i = 0
    while i < pinnar_3
        output3 << "| "

        i += 1
    end
    
    puts "antal pinnar kvar:"
    return output1, output2, output3

end

def display_pinnar_4(pinnar_1,pinnar_2,pinnar_3, pinnar_4)
    output1 = ""
    output2 = ""
    output3 = ""
    output4 = ""

    i = 0 
    
    while i < pinnar_1
        output1 << "| "

        i +=1
    end
    i = 0
    while i < pinnar_2
        output2 << "| "

        i += 1
    end
    i = 0
    while i < pinnar_3
        output3 << "| "

        i += 1
    end
    i = 0
    while i < pinnar_4
        output4 << "| "

        i += 1
    end
    
    puts "antal pinnar kvar:"
    return output1, output2, output3, output4

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

def bottens_tur(pinnar)

    puts "botten bestämmer sig"
    sleep(2)

    case pinnar
    when 2..4
        antal = pinnar - 1
    when 6..8
        antal = pinnar - 5
    when 10..12
        antal = pinnar - 9
    when 14..16
        antal = pinnar - 13
    when 18
        antal = pinnar - 15
    else 
        p "he"
        antal = rand(1..3)
    end

    pinnar -= antal

    sleep 1

    return pinnar

end

game()