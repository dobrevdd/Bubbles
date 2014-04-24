/**
 * Created with IntelliJ IDEA.
 * User: dido
 * Date: 4/4/14
 * Time: 11:48 AM
 * To change this template use File | Settings | File Templates.
 */
package {
import flash.display.Bitmap;

import starling.display.DisplayObject;
import starling.display.Image;
import starling.display.Quad;
import starling.display.Sprite;
import starling.events.EnterFrameEvent;
import starling.events.Event;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;
import starling.text.TextField;
import starling.textures.Texture;

import com.greensock.TweenLite;

public class Game extends Sprite {

    [Embed(source="../assets/circle.png")]
    private static var circle1:Class;
    public static var texture:Texture;

    private var circle:Circle;
    private var circles:Vector.<Circle>;

    private var myTween:TweenLite;
    private var myTweens:Vector.<TweenLite>;


    public function Game() {

        addEventListener(Event.ADDED_TO_STAGE, init);
        addEventListener(TouchEvent.TOUCH, onClick);
    }

    private function init(event:Event):void {

        circles = new Vector.<Circle>();

        // create a Bitmap object out of the embedded image
        var circle1Bitmap:Bitmap = new circle1();

        // create a Texture object to feed the Image object
        texture = Texture.fromBitmap(circle1Bitmap);

        circle = new Circle(2);
        circles.push(circle);
        circle.x = Math.random()*stage.stageWidth;
        circle.y = Math.random()*stage.stageHeight;

        trace(stage.stageWidth);
        trace(stage.stageHeight);



        addChild(circle);

        myTween = new TweenLite(circle, 2, {x:200, y:117, onComplete:onFinishTween, onCompleteParams:[circle,myTween]});
        myTween.play();
        //TweenLite.to(circle, 2, {x:200, y:117, onComplete:onFinishTween});


    }

    private function onFinishTween(circle: Circle,myTween1:TweenLite):void {
        var xCord: uint = Math.random()*stage.stageWidth;
        var yCord: uint = Math.random()*stage.stageHeight;
        //TweenLite.to(circle, 2, {x:xCord, y:yCord, onComplete:onFinishTween});
        myTween1 = new TweenLite(circle, 2, {x:xCord, y:yCord, onComplete:onFinishTween, onCompleteParams:[circle,myTween1]});
    }

    private function onClick(e:TouchEvent):void
    {
        var touches:Vector.<Touch> = e.getTouches(this);
        var clicked:DisplayObject = e.currentTarget as DisplayObject;
        if ( touches.length == 1 )
        {
            var touch:Touch = touches[0];
            if ( touch.phase == TouchPhase.ENDED )
            {
                var s: Circle;
                //trace(e.currentTarget, e.target);
                var w: Image;
                w = e.target as Image;
                s = w.parent as Circle;

                var num:uint = s.getNum();

                for(var i:int = 1; i<=num; i++) {
                    var xCord: uint = Math.random()*stage.stageWidth;
                    var yCord: uint = Math.random()*stage.stageHeight;

                    circle = new Circle(num+1);
                    circles.push(circle);
                    circle.x = s.x + Math.random() * 30;
                    circle.y = s.y + Math.random() * 30;
                    addChild(circle);
                    myTween = new TweenLite(circle, Math.random() * 3, {x:xCord, y:yCord, onComplete:onFinishTween, onCompleteParams:[circle,myTween]});
                    myTween.play();
                }

                TweenLite.killTweensOf(s);
                s.destroy();

                //trace(w.parent);


            }
        }
    }



}
}
