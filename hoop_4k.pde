final int rings = 15;
final int radius = 15;

void setup(){
  size(800, 800);
  background(30);
}


void draw(){
  //Setting colormode to HSB so i can shift the hue
  colorMode(HSB, 255);
  noStroke();
  //Setting fill color to be a transparent dark color and overlaying it over the entire screen.
  fill(0, 0, 30, 10);
  rect(0, 0, width, height);
  
  translate(width / 2, 50);
  for(int i = 0; i < rings; i++){
    //Shifting the hue
    fill(255 * abs(rings / 2 - i) / rings * 2, 255, 255);
    //Size; the width of the sphere at index i. Taking the sine of the acos of the index divided by the amount of rings.
    //Index has been offset by 0.5 so its still moving at the top, otherwise size at the poles would be 0.
    float size = sin(acos(((i + 0.5) / ((float)rings) - 0.5) * 2));
    
    //Translate the ring down for each index.
    translate(0, (height - 200) / (float)rings);
    //And finally just drawing a circle at each position, using sine and cosine to make it appear like its 3d
    circle(sin(frameCount / 60.0) * (width / 2 - 100) * size, cos(frameCount / 60.0) * height / 30 * size, radius);
  }
}
