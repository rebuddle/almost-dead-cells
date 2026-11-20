// imports
import src.entity.*;
import src.terrain.*;

// ### -- Execute Main -- ###
final class Main extends hxd.App {
    private var player: src.entity.Player;
    private var terrain: src.terrain.Terrain;
    private var bodies: Array<src.entity.Player>;
    private var body_count: Int;

    override private function init() {
        // init hxd.app
        super.init();

        // initialize map
        terrain = new src.terrain.Terrain(0, s2d.height - Terrain.size * 5, s2d.width, Terrain.size * 5, s2d);

        // initialize player
        player = new src.entity.Player(s2d.width/2, Entity.size, s2d);

        // bodies
        body_count = 10;
        bodies = [];

    }

    override private function update(dt: Float) {
        // update player
        player.update(dt);

        // terrain collision
        if (body_count > 0) {
            if (player.bounds.intersects(terrain.bounds)) {
                // move player to top of terrain
                player.y = terrain.y - player.height;
                bodies.insert(0, player);
                player = new src.entity.Player(s2d.width/2, Entity.size, s2d);
                body_count--;
            }
            // body collision
            for (body in bodies) {
                if (player.bounds.intersects(body.bounds)) {
                    player.y = body.y - player.height;
                    bodies.insert(0, player);
                    player = new src.entity.Player(s2d.width/2, Entity.size, s2d);
                    body_count--;
                }
            }
        }
    }

    static function main() {
        new Main();
    }
 }