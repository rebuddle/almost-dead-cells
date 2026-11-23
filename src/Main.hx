// imports
import src.entity.*;
import src.terrain.*;

// ### -- Execute Main -- ###
final class Main extends hxd.App {
    private var player: src.entity.Player;
    private var terrain: src.terrain.Terrain;
    private var bodies: Array<src.entity.Player>;
    private var body_count: Int;
    private var delay: Float;

    override private function init() {
        // init hxd.app
        super.init();

        // initialize map
        terrain = new src.terrain.Terrain(0, s2d.height - Terrain.size * 4, s2d.width, s2d.height, s2d);

        // initialize player
        trace("Player placed at:");
        trace(s2d.width/2, Entity.size);
        player = new src.entity.Player(s2d.width/2, Entity.size, s2d);

        // bodies
        body_count = 10;
        bodies = [];

        // game delay
        delay = 0;

    }

    override private function update(dt: Float) {
        delay += dt;

        // delay has been met
        if (delay > 3) {
            // update player
            player.update(dt);

            // dropping bodies
            if (hxd.Key.isPressed(hxd.Key.SPACE) && body_count > 0) {
                player.swap_to_terrain();
                player = new src.entity.Player(s2d.width/2, Entity.size, s2d);
                body_count--;
            }
        }
    }

    static function main() {
        new Main();
    }
 }