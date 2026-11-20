package src.terrain;

class Terrain extends h2d.Bitmap {
    // variables
    public static inline var size: Int = 32;
    public var bounds: h2d.col.Bounds;

    // create object
    public function new(x: Float, y: Float, w: Int, h: Int, scene: h2d.Scene) {
        var ttile = h2d.Tile.fromColor(0xFFFFFF, w, h);

        // inherit super
        super(ttile, scene); // green color for terrain

        // variables
        this.x = x;
        this.y = y;

        // size
        this.width = w;
        this.height = h;
        this.bounds = h2d.col.Bounds.fromValues(this.x, this.y, this.width, this.height);

        // add to scene
        scene.add(this);
    }
}