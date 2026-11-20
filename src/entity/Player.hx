package src.entity;

// import packages
import src.entity.Entity;

class Player extends Entity {
    // variables
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
        inputY = 0;

        // calculate movement vector based on input
        if (hxd.Key.isDown(hxd.Key.A)) inputX -= 1;
        if (hxd.Key.isDown(hxd.Key.D)) inputX += 1;
        if (hxd.Key.isDown(hxd.Key.W)) inputY -= 1;
        if (hxd.Key.isDown(hxd.Key.S)) inputY += 1;

        // normalize length of vector
        var length = Math.sqrt(inputX * inputX + inputY * inputY);
        if (length > 0) {
            inputX /= length;
            inputY /= length;
        }

        // move the player
        this.movement(dt, [inputX, inputY]);
    }
}