package src.entity;

// ### -- Entity Object -- ###
class Entity extends h2d.Bitmap {
    // create object
    public function new(x: Float, y: Float, scene: h2d.Scene) {
        // inherit super
        super();

        // variables
        this.x = x;
        this.y = y;
        scene.add(this);

        // size
        this.width = 32;
        this.height = 32;
    }
}