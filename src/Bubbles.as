package {

import flash.display.Sprite;
import flash.geom.Rectangle;

import starling.core.Starling;

public class Bubbles extends Sprite {
    public function Bubbles() {

        var screenWidth:int=stage.fullScreenWidth;
        var screenHeight:int=stage.fullScreenHeight;
        var viewPort:Rectangle=new Rectangle(0,0,screenWidth,screenHeight);

        stage.color = 0x002143;

        var bubble:Starling = new Starling(Game, stage, viewPort);
        bubble.showStats = true;
        bubble.start();
    }
}
}
