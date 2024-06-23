PImage img;
boolean showImage = true; // Variable para mostrar u ocultar la imagen
float circleX, circleY; // Coordenadas del círculo central
color fillColor = color(255); // Color de relleno inicial (blanco)
color backgroundColor = color(255); // Color de fondo inicial (blanco)

void setup() {
  size(800, 400); // Tamaño de la ventana
  resetProgram(); // Llama a la función para inicializar variables y cargar la imagen
}

void draw() {
  background(backgroundColor); // Establece el color de fondo
  
  if (showImage) {
    image(img, width / 4, height / 2, 400, 400); // Muestra la imagen en el centro de la mitad izquierda
  }
  
  drawLines(); // Dibuja las líneas en las cuatro esquinas
  fill(fillColor); // Establece el color de relleno
  drawCircles(circleX, circleY); // Dibuja los círculos en las coordenadas especificadas
}

void keyPressed() {
  if (key == 'b' || key == 'B') {
    resetProgram(); // Reinicia el programa si se presiona la tecla 'b'
  }
  
  if (key == 'i' || key == 'I') {
    showImage = !showImage; // Alterna la visibilidad de la imagen si se presiona la tecla 'i'
  }
}

void mousePressed() {
  if (dist(mouseX, mouseY, circleX, circleY) < 80) {
    changeColorAndMoveCircles(); // Cambia el color y mueve el círculo si se hace clic dentro del círculo más pequeño
  }
}

void changeColorAndMoveCircles() {
  // Genera colores aleatorios
  float r = random(255);
  float g = random(255);
  float b = random(255);
  backgroundColor = color(r, g, b); // Establece el color de fondo
  
  // Establece un color más claro para el círculo
  fillColor = color(
    constrain(r + 50, 0, 255),
    constrain(g + 50, 0, 255),
    constrain(b + 50, 0, 255)
  );
  
  // Movimiento aleatorio del círculo
  circleX += random(-10, 10);
  circleY += random(-10, 10);
  
  // Limitar el movimiento dentro de la ventana
  circleX = constrain(circleX, 215, width - 215);
  circleY = constrain(circleY, 215, height - 215);
}

void drawLines() {
  strokeWeight(20); // Grosor de las líneas
  
  // Dibujar líneas horizontales en la parte superior izquierda
  for (int i = 0; i < 5; i++) {
    float y = i * 40 + 20;
    line(600, y, width / 2, y);
  }
  
  // Dibujar líneas verticales en la parte superior derecha
  for (int i = 0; i < 5; i++) {
    float x = width / 2 + i * 40 + 210;
    line(x, 0, x, height / 2);
  }
  
  // Dibujar líneas verticales en la parte inferior izquierda
  for (int i = 0; i < 5; i++) {
    float x = i * 40 + 400;
    line(x, height / 2, x, height);
  }
  
  // Dibujar líneas horizontales en la parte inferior derecha
  for (int i = 0; i < 5; i++) {
    float y = height / 2 + i * 40 + 20;
    line(600, y, width, y);
  }
}

void drawCircles(float centerX, float centerY) {
  stroke(20); // Color del borde del círculo
  strokeWeight(20); // Grosor del borde
  
  // Dibuja los tres círculos concéntricos
  ellipse(centerX, centerY, 215, 215);
  ellipse(centerX, centerY, 150, 150);
  ellipse(centerX, centerY, 80, 80);
}

void resetProgram() {
  img = loadImage("img.jpeg"); // Carga la imagen
  imageMode(CENTER); // Establece el modo de la imagen en el centro
  fillColor = color(255); // Reinicia el color de relleno a blanco
  backgroundColor = color(255); // Reinicia el color de fondo a blanco
  circleX = width - 205; // Posición inicial del círculo en el eje X
  circleY = 200; // Posición inicial del círculo en el eje Y
}



//Función propia con parámetros que NO retorna un valor
//void drawCustomShape(float x, float y, float size) {
  //noFill();
  //stroke(0);
  //strokeWeight(2);
  
  //beginShape();
  //for (int i = 0; i < 5; i++) {
    //float angle = map(i, 0, 5, 0, TWO_PI);
    //float sx = x + cos(angle) * size;
    //float sy = y + sin(angle) * size;
    //vertex(sx, sy);
  //}
  //endShape(CLOSE);
//}

// Función propia con parámetros que RETORNA un valor
//float calculateDistance(float x1, float y1, float x2, float y2) {
  //return dist(x1, y1, x2, y2);
//}
