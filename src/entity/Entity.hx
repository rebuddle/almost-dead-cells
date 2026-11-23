package src.entity;

// ### -- Entity Object -- ###
class Entity extends h2d.Bitmap {
    // variables
    public static inline var size: Int = 32;
    public var speed: Int;
    public var scene: h2d.Scene;
    public var bounds: h2d.col.Bounds;
    public var group: String;

    // create object
    public function new(x: Float, y: Float, scene: h2d.Scene) {
        // inherit super
        super();

        // variables
        this.x = x;
        this.y = y;
        this.speed = 64;
        this.scene = scene;
        this.name = "Entity";

        // size
        this.width = size;
        this.height = size;
        this.bounds = h2d.col.Bounds.fromValues(this.x, this.y, this.width, this.height);

        // add to scene
        scene.add(this);
    }

    public function movement(dt: Float, vector: Array<Float>) {
        // calculate new destination
        var dest_x = this.x + this.speed * vector[0] * dt;
        var dest_y = this.y + this.speed * vector[1] * dt;
        var nextBounds = h2d.col.Bounds.fromValues(dest_x, dest_y, this.width, this.height);

        // collision variables
        var collision_types = ["Terrain"];
        // loop through items to check for collision
        for (child in this.scene) {
            if (collision_types.contains(child.name)) {
                var childBounds = child.getBounds();
                // collision logic here
                if (nextBounds.intersects(childBounds)) {
                    // get bounds
                    // child info
                    trace(child.name);
                    trace(childBounds);
                    trace(child.x);
                    trace(child.y);

                    // to be info
                    trace("Next Bounds");
                    trace(nextBounds);
                    trace(dest_x);
                    trace(dest_y);

                    // this object
                    trace(this.name);
                    trace(this.getBounds());
                    trace(this.x);
                    trace(this.y);

                    // maybe not
                    dest_x = this.x;
                    dest_y = this.y;
                }
            }
        }

        // // check for collisions with the scene boundaries
        // if (this.width + dest_x > scene.width) vector[0] = 0; // stop moving right
        // if (this.width + dest_x < 0) vector[0] = 0; // stop moving left
        // if (this.height + dest_y > scene.height) vector[1] = 0; // stop moving down
        // if (this.height + dest_y < 0) vector[1] = 0; // stop moving up

        // apply movement
        this.x = dest_x;
        this.y = dest_y;

        // update bounds
        this.bounds.set(this.x, this.y, this.width, this.height);
    }
}