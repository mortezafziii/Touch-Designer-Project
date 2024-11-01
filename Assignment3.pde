ArrayList<Particle> particles = new ArrayList<Particle>();

void setup() {
  size(800, 600);
  background(0);
  textAlign(CENTER);
  textSize(16);
  fill(255);
  text("Click to add particles, press 'c' to clear, 's' to stop motion!", width/2, height/2);
}

void draw() {
  background(0, 20);  // Faint trail effect

  for (Particle p : particles) {
    p.update();
    p.display();
  }
}

// Add new particles on mouse click
void mousePressed() {
  for (int i = 0; i < 10; i++) {  // Add 10 particles with each click
    particles.add(new Particle(mouseX, mouseY));
  }
}

// Press 'c' to clear particles, 's' to stop or start motion
void keyPressed() {
  if (key == 'c') {
    particles.clear();
  } else if (key == 's') {
    for (Particle p : particles) {
      p.toggleMotion();
    }
  }
}

class Particle {
  float x, y;
  float xSpeed, ySpeed;
  float size;
  color col;
  boolean moving;

  Particle(float x, float y) {
    this.x = x;
    this.y = y;
    xSpeed = random(-2, 2);
    ySpeed = random(-2, 2);
    size = random(10, 20);
    col = color(random(255), random(255), random(255), 150);
    moving = true;
  }

  void update() {
    if (moving) {
      x += xSpeed;
      y += ySpeed;
      // Bounce off edges
      if (x < 0 || x > width) xSpeed *= -1;
      if (y < 0 || y > height) ySpeed *= -1;
    }
  }

  void display() {
    noStroke();
    fill(col);
    ellipse(x, y, size, size);
  }

  void toggleMotion() {
    moving = !moving;
  }
}
