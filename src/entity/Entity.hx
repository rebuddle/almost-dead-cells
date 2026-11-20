package src.entity;

// ### -- Entity Object -- ###
class Entity extends h2d.Bitmap {
    // variables
    public static inline var size: Int = 32;
    public var speed: Int;
    public var scene: h2d.Scene;

    // create object
    public function new(x: Float, y: Float, scene: h2d.Scene) {
        // inherit super
        super();

        // variables
        this.x = x;
        this.y = y;
        this.speed = 400;
        this.scene = scene;

        // size
        this.width = size;
        this.height = size;

        // add to scene
        scene.add(this);
    }

    public function movement(dt: Float, vector: Array<Float>) {
        // check for collisions with the scene boundaries
        if (this.x + this.width + this.speed * vector[0] * dt > scene.width) vector[0] = 0; // stop moving right
        if (this.x + this.speed * vector[0] * dt < 0) vector[0] = 0; // stop moving left
        if (this.y + this.height + this.speed * vector[1] * dt > scene.height) vector[1] = 0; // stop moving down
        if (this.y + this.speed * vector[1] * dt < 0) vector[1] = 0; // stop moving up
  
        // check for collisions with enemies

        // apply movement
        this.x += this.speed * vector[0] * dt;
        this.y += this.speed * vector[1] * dt;
    }
}