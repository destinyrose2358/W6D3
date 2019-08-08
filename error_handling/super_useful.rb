# PHASE 2
def convert_to_int(str)
  Integer(str)
rescue ArgumentError
  return nil
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise Coffee_Error
  else 
    raise StandardError
  end 
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue Coffee_Error
    puts "Oh, I love coffee! I'll give you another chance."
    retry
  rescue StandardError
    puts "What on earth is this!? Disgusting!"
  end
end

class Coffee_Error < StandardError
  def message
    "coffee"
  end
end

class Best_Friend_Poser_Error < StandardError
  def message
    "Wow, what a poser. You couldn't possibly be best friends."
  end
end

class Empty_String_Error < StandardError
  def message
    "Empty string!"
  end

end
# PHASE 4
class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    
    raise Best_Friend_Poser_Error unless yrs_known >= 5
    raise Empty_String_Error if name.length <= 0 || fav_pastime.length <= 0

    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. 😄"
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me." 
  end
end


