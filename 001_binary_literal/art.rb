class Untitled1
  UPPER_LIMIT_BASE_LIMIT = 36
  UPPER_SCREEN_LENGTH = 15

  def mission!
    <<-MISSION



      class Untitled1#art
      ---

      count from 2 to x
        for each x
          count from 0 to y
            convert y to base x
              print y

     the variables are:
       * the limit of the range of numbers counting
       * the limit the the range of bases
       * the speed of the program
       * the screen size
       * the color the output
       * the timing of the program



    MISSION
  end

  def art
    sleep 1
    puts mission!; sleep 10
    (2..UPPER_LIMIT_BASE_LIMIT).each do |w|
      (0..UPPER_SCREEN_LENGTH).each do |j|
        r = j.to_s(w)
        print " #{r} "
        sleep 0.02
      end
      puts
    end

    puts "=" * 80
    sleep 1
  end
end

Untitled1.new.art
