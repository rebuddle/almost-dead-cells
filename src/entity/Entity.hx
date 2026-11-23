package src.entity;

// ### -- Entity Object -- ###
class Entity extends h2d.Bitmap {
    // variables
    public static inline var size: Int = 32;
    public var speed: Int;
    public var scene: h2d.Scene;
    public var bounds: h2d.col.Bounds;
    public var group: String;
    public var isGrounded: Bool;

    // create object
    public function new(x: Float, y: Float, scene: h2d.Scene) {
        // inherit super
        super();

        // variables
        this.x = x;
        this.y = y;
        this.speed = 320;
        this.scene = scene;
        this.name = "Entity";

        // size
        this.width = size;
        this.height = size;
        this.isGrounded = false;
        this.bounds = h2d.col.Bounds.fromValues(this.x, this.y, this.width, this.height);

        // add to scene
        scene.add(this);
    }

    public function movement(dt: Float, vector: Array<Float>) {
        // calculate new destination
        var dest_x = this.x + this.speed * vector[0] * dt;
        var dest_y = this.y + this.speed * vector[1] * dt;
        var xBounds = h2d.col.Bounds.fromValues(dest_x, this.y -1, this.width, this.height);
        var yBounds = h2d.col.Bounds.fromValues(this.x-1, dest_y, this.width, this.height);

        // collision variables
        var collision_types = ["Terrain"];
        // loop through items to check for collision
        for (child in this.scene) {
            if (collision_types.contains(child.name)) {
                var childBounds = child.getBounds();
                // collision logic here
                if (xBounds.intersects(childBounds)) {
                    // reset
                    if (vector[0] > 0) dest_x = childBounds.xMin - this.width;
                    if (vector[0] < 0) dest_x = childBounds.xMax;
                    // dest_x = this.x;
                }
                if (yBounds.intersects(childBounds)) {
                    // reset
                    if (vector[1] > 0) {
                        dest_y = childBounds.yMin - this.height;
                        this.isGrounded = true;
                    }
                    if (vector[1] < 0) {
                        dest_y = childBounds.yMax;
                        this.isGrounded = false;
                    }
                }
            }
        }

        // // check for collisions with the scene boundaries
        var max_x = Math.max(0, scene.width - this.width);
        var max_y = Math.max(0, scene.height - this.height);
        dest_x = Math.max(0, Math.min(dest_x, max_x));
        dest_y = Math.max(0, Math.min(dest_y, max_y));

        // apply movement
        this.x = dest_x;
        this.y = dest_y;

        // update bounds
        this.bounds.set(this.x, this.y, this.width, this.height);
    }
}