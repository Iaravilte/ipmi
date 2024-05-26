PImage imagen1, imagen2, imagen3;
float textoX, textoY;
boolean animacion = false; /* La animación comienza en pausa*/
boolean inicio = false; /* Controla si se ha iniciado la animación*/
int imagenActual = 1; /* Controla cuál imagen se está mostrando*/
int tiempoInicio;
int duracionImagen = 3000; /* Duración en milisegundos que cada imagen se muestra*/

void setup() {
  size(640, 480);
  
  /* Carga las imágenes*/
  imagen1 = loadImage("imagen1.jpg");
  imagen2 = loadImage("imagen2.jpg");
  imagen3 = loadImage("imagen3.jpg");
  
  /* Inicia la posición del texto*/
  textoX = 0; // Empieza desde la izquierda
  textoY = height / 2; // Centramos verticalmente el texto
  
  /* Configurar botones*/
  textSize(20);
  /* Botón de inicio*/
  fill(0, 255, 0);
  rect(width - 240, 20, 100, 40);
  fill(255);
  text("Iniciar", width - 220, 45);
  /* Botón de reinicio*/
  fill(255, 0, 0);
  rect(width - 120, 20, 100, 40);
  fill(255);
  text("Reiniciar", width - 110, 45);
}

void draw() {
  background(0);
  
  if (inicio) {
    if (animacion) {
      /* Comprobar si debe cambiar de imagen*/
      if (millis() - tiempoInicio > duracionImagen) {
        imagenActual++;
        if (imagenActual > 3) {
          imagenActual = 1;
        }
        tiempoInicio = millis();
        /* Reinicia la posición del texto cada vez que se cambia de imagen*/
        textoX = 0;
      }
      
      /* Mover la posición del texto de izquierda a derecha*/
      textoX += 2; // Incrementar para mover a la derecha
      if (textoX > width) {
        textoX = -textWidth("Texto " + imagenActual); // Reiniciar posición cuando sale de la pantalla
      }
      
      /* Mostrar la imagen actual*/
      if (imagenActual == 1) {
        image(imagen1, (width - imagen1.width) / 2, (height - imagen1.height) / 2);
        fill(255, 0, 0); /*color rojo*/
        textSize(24);
        text("Los videojuegos son programas de\n ordenador que conectados a una \n pantalla o televisión, integran un sistema\n de vídeo y audio", textoX, textoY);
      } else if (imagenActual == 2) {
        image(imagen2, (width - imagen2.width) / 2, (height - imagen2.height) / 2);
        fill(0, 255, 0); /*color verde*/
        textSize(24);
        text("Un videojuego o juego de video es un\n software o juego electrónico en el que\n uno o más jugadores interactúan\n por medio de un controlador", textoX, textoY);
      } else if (imagenActual == 3) {
        image(imagen3, (width - imagen3.width) / 2, (height - imagen3.height) / 2);
        fill(255); /*color blanco*/
        textSize(24);
        text("El juego digital hace que los niños pequeños\n sean usuarios activos de tecnologías y\n de contenido de medios digitales", textoX, textoY);
      }
    }
  }
  
 
  /* Botón de inicio*/
  fill(0, 255, 0);
  rect(width - 240, 20, 100, 40);
  fill(255);
  text("Iniciar", width - 220, 45);
  /* Botón de reinicio*/
  fill(255, 0, 0);
  rect(width - 120, 20, 100, 40);
  fill(255);
  text("Reiniciar", width - 110, 45);
}

void mousePressed() {
  /* Detectar clic en el botón de inicio*/
  if (mouseX > width - 240 && mouseX < width - 140 && mouseY > 20 && mouseY < 60) {
    inicio = true;
    animacion = true;
    tiempoInicio = millis(); /* Iniciar el temporizador*/
  }
  
  /* Detectar clic en el botón de reinicio*/
  if (mouseX > width - 120 && mouseX < width - 20 && mouseY > 20 && mouseY < 60) {
    imagenActual = 1; /* Reinicia la imagen al inicio*/
    textoX = 0; /* Reinicia la posición del texto*/
    tiempoInicio = millis(); /* Reinicia el temporizador*/
    animacion = true; /* Reanudar la animación*/
  }
}
