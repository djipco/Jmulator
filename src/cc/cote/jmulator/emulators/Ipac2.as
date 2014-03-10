package cc.cote.jmulator.emulators 
{
	import cc.cote.jmulator.Emulator;
	import flash.ui.Keyboard;
	import flash.display.InteractiveObject;

	/**
	 * The Ipac2 class defines the characteristics of the I-PAC 2 board made 
	 * by Ultimarc. It extends the base Jmulator class and, primarily, contains 
	 * the mappings between input labels and keyboard key codes that are 
	 * specific to this model. If you want to use an I-PAC 2 board, this is the
	 * class to instantiate.
	 * 
	 * <p>Using this class is straightforward. You create an Ipac2 object and 
	 * then add listeners to it for the inputs you are interested in. Here is a 
	 * simple example to get you started :</p>
	 * 
	 * <listing version="3.0">
	 * 
	 * import cc.cote.jmulator.*;
	 * import cc.cote.jmulator.emulators.*;
	 * 
	 * var emu:Ipac2 = new Ipac2(stage);
	 * emu.addEventListener('2COIN', test);
	 * 
	 * function test(e:EmulatorEvent):void {
	 * 	trace(e);
	 * }
	 * </listing>
	 * 
	 * <p>Please note that this class will only work with encoders using the 
	 * default (MAME) settings and not with custom programs.</p>
	 * 
	 * <p>Limitations : Flash Player is currently unable to detect a KEY_DOWN or 
	 * KEY_UP event for the ALT key. This means that the input labeled "1SW2" 
	 * (which uses the ALT key in the default MAME configuration) does not work.
	 * </p>
	 * 
	 * <p>Also note that the 1SW4 input - which is assigned to the SHIFT key - 
	 * will never be in typematic mode. This is the behaviour of the SHIFT key 
	 * on most modern operating systems and has nothing to do with you board, 
	 * Flash or this library.</p>
	 * 
	 * @see http://www.ultimarc.com Ultimarc's website
	 * @see cc.cote.jmulator.Emulator Emulator class
	 */
	public class Ipac2 extends Emulator 
	{

		/**
		 * Creates an Ipac2 object extending the base Emulator object. On top
		 * of inherited properties, this object defines the board-specific 
		 * mappings between input label and key code generated.
		 * 
		 * @param listenOn An InteractiveObject to attach the keyboard listener 
		 * to. Usually this is the Stage.
		 * @param typematic Whether or not to use the OS typematic feature
		 * @param triggering The method to use to trigger events. Can be 
		 * Emulator.TRIGGER_ON, Emulator.TRIGGER_OFF or Emulator.TRIGGER_BOTH
		 * (default). TRIGGER_ON means to dispatch the events only when the input
		 * is activated, TRIGGER_OFF means to dispatch the events only when the 
		 * input is deactivated and TRIGGER_BOTH means to trigger events when the 
		 * input is activated and deactivated.
		 */			
		public function Ipac2(listenOn:InteractiveObject, 
					typematic:Boolean = true, triggering:String = 'both') {
			
			super(listenOn, typematic, triggering);
			
			map[Keyboard.RIGHT] 	= ['1RGHT'];		// right arrow 	(39)
			map[Keyboard.LEFT] 		= ['1LEFT'];		// left arrow 	(37)
			map[Keyboard.UP] 		= ['1UP'];			// up arrow 	(38)
			map[Keyboard.DOWN] 		= ['1DOWN'];		// down arrow 	(40)
			
			map[Keyboard.CONTROL] 	= ['1SW1'];			// left-ctrl 	(17)
			map['disabled']		 	= ['1SW2'];			// left-alt		(18)
			map[Keyboard.SPACE] 	= ['1SW3'];			// space 		(32)
			map[Keyboard.SHIFT] 	= ['1SW4'];			// left-shift 	(16)
			map[90]			 		= ['1SW5'];			// z
			map[88]			 		= ['1SW6'];			// x
			map[67]			 		= ['1SW7'];			// c
			map[86]			 		= ['1SW8'];			// v

			map[49] 				= ['1STRT'];		// 1
			map[53]					= ['1COIN'];		// 5
			
			map[80]			 		= ['1A'];			// p
			map[Keyboard.ENTER]		= ['1B'];			// enter	 	(13)
			
			map[71] 				= ['2RGHT'];		// g
			map[68] 				= ['2LEFT'];		// d
			map[82] 				= ['2UP'];			// r
			map[70] 				= ['2DOWN'];		// f
						
			map[65] 				= ['2SW1'];			// a
			map[83] 				= ['2SW2'];			// s
			map[81] 				= ['2SW3'];			// q
			map[87] 				= ['2SW4'];			// w
			map[73]			 		= ['2SW5'];			// i
			map[75]			 		= ['2SW6'];			// k
			map[74]			 		= ['2SW7'];			// j
			map[76]			 		= ['2SW8'];			// l
			
			map[54]					= ['2COIN'];		// 6
			map[50] 				= ['2STRT'];		// 2
			
			map[Keyboard.TAB]		= ['2A'];			// tab 			(9)
			map[Keyboard.ESCAPE]	= ['2B'];			// esc 			(27)
			
		}
	}
}
