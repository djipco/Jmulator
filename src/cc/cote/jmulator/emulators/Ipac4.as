package cc.cote.jmulator.emulators 
{
	import cc.cote.jmulator.Emulator;
	import flash.ui.Keyboard;
	import flash.display.InteractiveObject;

	/**
	 * The Ipac4 class defines the characteristics of the I-PAC 4 board made 
	 * by Ultimarc. It extends the base Jmulator class and, essentially, 
	 * contains the mappings between input labels and keyboard key codes that 
	 * are specific to this board model. If you want to use an I-PAC 4 board, 
	 * this is the class to instantiate.
	 * 
	 * <p>Using this class is straightforward. You create an Ipac4 object and 
	 * then add listeners to it for the inputs you are interested in. Here is a 
	 * simple example to get you started :</p>
	 * 
	 * <listing version="3.0">
	 * 
	 * import cc.cote.jmulator.*;
	 * import cc.cote.jmulator.emulators.*;
	 * 
	 * var emu:Ipac4 = new Ipac4(stage);
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
	 * <p>Beware that the configuration of this board assigns more than one 
	 * input to the same keyCode. </p>
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
	 * <p>Finally, please note that the foloowing inputs (which are not assigned 
	 * by default in the MAME configuration) cannot be used : 3SW5, 3SW6, 3SW7, 
	 * 3SW8, 4SW5, 4SW6, 4SW7, 4SW8.</p>
	 * 
	 * @see http://www.ultimarc.com Ultimarc's website
	 * @see cc.cote.jmulator.Emulator Emulator class
	 */
	public class Ipac4 extends Emulator 
	{

		/**
		 * Creates an Ipac4 object extending the base Emulator object. On top
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
		public function Ipac4(listenOn:InteractiveObject, 
					typematic:Boolean = true, triggering:String = 'both') {
			
			super(listenOn, typematic, triggering);
			
			map[53]					= ['1COIN'];			// 5
			map[54]					= ['2COIN'];			// 6
				
			map[49] 				= ['1STRT'];			// 1
			map[50] 				= ['2STRT'];			// 2
					
			map[Keyboard.RIGHT] 	= ['1RGHT'];			// right arrow
			map[Keyboard.LEFT] 		= ['1LEFT'];			// left arrow
			map[Keyboard.UP] 		= ['1UP'];				// up arrow
			map[Keyboard.DOWN] 		= ['1DOWN'];			// down arrow
			
			map[18]		 			= ['1SW2'];				// left-alt		(18)
			map[Keyboard.SPACE] 	= ['1SW3'];				// space
			map[90]			 		= ['1SW5'];				// z
			map[88]			 		= ['1SW6'];				// x
			map[67]			 		= ['1SW7'];				// c
			map[86]			 		= ['1SW8'];				// v
			
			map[80]			 		= ['1A'];				// p
			map[Keyboard.ENTER]		= ['1B', '3SW3'];		// enter
			
			map[71] 				= ['2RGHT'];			// g
			map[68] 				= ['2LEFT'];			// d
			map[82] 				= ['2UP'];				// r
			map[70] 				= ['2DOWN'];			// f
				
			map[65] 				= ['2SW1'];				// a
			map[83] 				= ['2SW2'];				// s
			map[81] 				= ['2SW3'];				// q
			map[87] 				= ['2SW4'];				// w
			map[73]			 		= ['2SW5', '3UP'];		// i
			map[75]			 		= ['2SW6', '3DOWN'];	// k
			map[74]			 		= ['2SW7', '3LEFT'];	// j
			map[76]			 		= ['2SW8', '3RGHT'];	// l

			map[Keyboard.TAB]		= ['2A'];				// tab
			map[Keyboard.ESCAPE]	= ['2B'];				// esc

			map[55]					= ['3COIN'];			// 7
			map[56]					= ['4COIN'];			// 8
			
			map[51]					= ['3STRT'];			// 3
			map[52]					= ['4STRT'];			// 4
			
			map[79]					= ['3SW4'];				// o
			
			map[85] 				= ['4RGHT'];			// u
			map[86] 				= ['4LEFT'];			// v
			map[89] 				= ['4UP'];				// y
			map[78] 				= ['4DOWN'];			// n
			
			map[66] 				= ['4SW1'];				// b
			map[69] 				= ['4SW2'];				// e
			map[72] 				= ['4SW3'];				// h
			map[77] 				= ['4SW4'];				// m			
			
			// Since Flash does not differentiate between LEFT-SHIFT and 
			// RIGHT-SHIFT those two inputs are forcefully bound together
			map[Keyboard.SHIFT] 	= ['1SW4', '3SW2'];		// left-shift, right-shift
			
			// Since Flash does not differentiate between LEFT-CTRL and 
			// RIGHT-CTRL those two inputs are forcefully bound together
			map[Keyboard.CONTROL] 	= ['1SW1', '3SW1'];		// left-ctrl, right-ctrl			
	
			// Those inputs are not mapped in the default MAME configuration. 
			// Therefore we set them as disabled.
			map['disabled']			= ['3SW5', '3SW6', '3SW7', '3SW8', '4SW5', 
														'4SW6', '4SW7', '4SW8'];
			
		}
	}
}
