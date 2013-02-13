require(
 ['../vendor'],()->
     $(document).ready ()->
       sc_id = "032a2ac3be8f183b4e491aa04feb6793"
       sc_secret = "c9e492434d7ed054ca72dfc67720a988"

       circle = new Circle(200,"#ddd")
       circle.draw()


  class Circle
    constructor :(@radius,@color)->
      console.log "woooooooooooo"
      @canvas = document.getElementById "canvas" 
      @context = canvas.getContext "2d"
      @center = 
        x : @canvas.width/2
        y : @canvas.height/2
      
      @draw()
     
    draw :->
      @context.beginPath()
      @context.arc @center.x,@center.y,@radius,0,2*Math.PI,false
      @context.fillStyle = @color
      @context.fill()




)
