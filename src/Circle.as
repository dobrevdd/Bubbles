/**
 * Created with IntelliJ IDEA.
 * User: dido
 * Date: 4/24/14
 * Time: 12:14 PM
 * To change this template use File | Settings | File Templates.
 */
package {
import starling.display.Image;
import starling.display.Sprite;
import starling.events.Event;

public class Circle extends Sprite {

    private var image:Image;
    private var r, g, b: uint;
    private var num: uint;

    public function Circle(num:uint) {

        this.num = num;
        addEventListener(Event.ADDED_TO_STAGE, init);
    }

    private function init():void {

        r = Math.random() * 255;
        g = Math.random() * 255;
        b = Math.random() * 255;

        image = new Image(Game.texture);
        image.color = RGB2hex(r, g, b);
        addChild(image);
    }

    private function RGB2hex (r:uint, g:uint, b:uint):Number
    {
        return ((r << 16) + (g << 8) + b);
    }

    public function getNum():uint {
        return num;
    }

    public function destroy():void {
        image.removeFromParent(true);
        this.removeFromParent(true);
    }
}
}
