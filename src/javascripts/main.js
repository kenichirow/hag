
var canvas,stage,context;
var shape,centerShape;

var dist = function(p1,p2) {
  var a,b;
  a = p1.x - p2.x;
  b = p1.y - p2.y; 
  return Math.sqrt(Math.pow(a,2) + Math.pow(b,2));  
}

function init(){
  canvas = document.getElementById("canvas");  
  context = canvas.getContext('2d');
  stage = new Stage(canvas);
  context = canvas.getContext('2d');
  context.font = "52px Fredoka One";
  $('#colorpicker').farbtastic('#color');
  context.globalAlpha=1;
  context.textAlign = "center";
  context.textBaseline = "top";   
}

function render() {
  var color,artist,title,vol;
  color = $('#color').val();
  artist = $('#artist').val();
  title = $('#title').val();
  vol = $('#vol').val();
  if(shape != undefined){ shape.graphics.clear();}
  if(centerShape != undefined){ centerShape.graphics.clear();}
  renderImage(color); 
  renderText(vol,artist,title); 
}

function renderImage(color) {
  var deg,radius,center,dist,circles;
  theta = 0;
  center = { x:250, y:250 };
  deg = 0;
  shape = new Shape();
  shape.alpha = 0.7; 
  g = shape.graphics;
  g.setStrokeStyle(3,1);
  var p;
  for(i=0; i<360; i++){
    deg += 1;
    theta = deg*Math.PI/180;
    radius = 200+(Math.random()*40); 
    p = {
      x : center.x+(radius*Math.sin(theta)),
      y : center.y+(radius*Math.cos(theta))
    };
    g.beginStroke(color);
    g.moveTo(center.x,center.y).lineTo(p.x,p.y);
    g.endStroke();
  }

  stage.addChild(shape);
  stage.update();

  centerShape=new Shape();
  centerShape.graphics.beginFill(color);
  centerShape.graphics.drawCircle(center.x,center.y,150);
  stage.addChild(centerShape);
  stage.update();
}

function renderText(vol,artist,title) {
  var fontsize_artist,fontsize_title;
  fontsize_artist = $('#fontsize_artist').val();
  fontsize_title = $('#fontsize_title').val();
  console.log(fontsize_artist)

  context.fillStyle = "#fff";

  context.font = fontsize_artist+"px Fredoka One";
  context.fillText(artist,250,210); 

  context.font = fontsize_title+"px Fredoka One";
  context.fillText(title,250,280); 

  context.font = "18px Fredoka One";
  context.fillText("himcast "+vol,250,165); 
}

function save(){
  var img = new Image();
  img.src = canvas.toDataURL('image/png');
  $("img","#savedArtwork").attr("src",img.src);
  $("#savedArtwork").show();
}
