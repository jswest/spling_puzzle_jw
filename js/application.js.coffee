# JOHN WEST
# SOLUTION TO THE SPLING DYNAMIC WHEEL PUZZLE

$ ->
  # SET SOME HELPFUL VARIABLES
  diameter = 500
  radius = diameter / 2
  pi = Math.PI
  perimeter = pi * diameter
  area = pi * (radius * radius)
  center_x = 250
  center_y = 250
  
  # NEW CIRCLE BUTTON LISTENER ( what happens when you click the center of the circle )
  $('#new-circle-button').click ->
    c = new ColorfulCircle( $('.colorful-circle').length ) # create the new colorful circle (see class below)
    c.display() # display it
    position_circles() #position it
    
  # CLEAR BUTTON LISTENER ( what happens when you click clear )
  $('#clear').click ->
    $('.colorful-circle').remove()
  
  # THE COLORFUL CIRCLE CLASS
  ColorfulCircle = ( x ) ->
    display: () ->
      # Append to the page-wrapper a colorful circle
      $('#page-wrapper').append("<div class='colorful-circle' id='circle#{x}'></div>")
      # Get a random color
      r = Math.round( Math.random() * 255 )
      g = Math.round( Math.random() * 255 )
      b = Math.round( Math.random() * 255 )
      # And set the circle as that color
      $("#circle#{x}").css( 'background-color': "rgb(#{r},#{g},#{b})" )
      
  # POSITION CIRCLES
  position_circles = () ->
    num_circles = $('.colorful-circle').length
    circles = $('.colorful-circle')
    for i in [1..num_circles]
      angle = (360 / num_circles) * (i) - 90 # -90 places first colorful circle at the top of the orbit circle
      x = (radius * Math.cos(angle*pi/180)) + center_x # since cos and sin return in radians, you have to get a little tricky
      y = (radius * Math.sin(angle*pi/180)) + center_y # ditto
      $('.colorful-circle').eq(i-1).css
        'top': y - 50 # -50 is to account for the size oof the colorful circle
        'left': x - 50 # ditto
    
      
    
    
  
  