// imports
import src.entity.*;

// ### -- Execute Main -- ###
final class Main extends hxd.App {
    private var player: src.entity.Player;

    override private function init() {
        // init hxd.app
        super.init();

        // initialize player
        player = new src.entity.Player(100, 100, s2d);
    }

    override private function update(dt: Float) {
        // update player
        player.update(dt);
    }

    static function main() {
        new Main();
    }
 }