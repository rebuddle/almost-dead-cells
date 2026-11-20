package src.entity;

// import packages
import src.entity.Entity;

class Player extends Entity {
    // variables
    public static inline var gravity: Float = 25;
    public var inputX: Float = 0;
    public var inputY: Float = 0;

    // create object
    public function new(x: Float, y: Float, scene: h2d.Scene) {
        super(x, y, scene);
    }

    // update object
    public function update(dt: Float) {
        // get input
        inputX = 0;
        inputY = gravity * dt;

        // calculate movement vector based on input
        if (hxd.Key.isDown(hxd.Key.A)) inputX -= 1;
        if (hxd.Key.isDown(hxd.Key.D)) inputX += 1;
        if (hxd.Key.isDown(hxd.Key.S)) inputY += 1;

        // move the player
        this.movement(dt, [inputX, inputY]);
    }
}