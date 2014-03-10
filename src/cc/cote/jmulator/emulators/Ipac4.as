package cc.cote.jmulator.emulators 
{
	import flash.display.InteractiveObject;
	import flash.system.Capabilities;
	import flash.ui.Keyboard;
	
	import cc.cote.jmulator.events.Ipac4Event;

	/**
	 * The IpacVe class defines the characteristics of the I-PAC 4 board made by Ultimarc. It 
	 * extends the base Emulator class and provides various functionalities to simplify working with 
	 * this keyboard emulators. Namely, you will be freed from researching keyboard codes. You will 
	 * be able to simply listen to events bearing the same names as the labels on the board you use. 
	 * The class also offers additional functionalities such as selective typematic management and 
	 * the choice between receiving all events, only ON events or only OFF events.
	 * 
	 * <p>Using this class is straightforward. You create an IpacVe object and then add listeners to 
	 * it for the inputs you are interested in. Here is a simple example to get you started :</p>
	 * 
	 * <listing version="3.0">
	 * 
	 * import cc.cote.jmulator.emulators.Ipac4;
	 * import cc.cote.jmulator.events.Ipac4Event;
	 * 
	 * var emu:Ipac4 = new Ipac4(stage);
	 * emu.addEventListener(Ipac4Event.INPUT_2COIN, test);
	 * 
	 * function test(e:Ipac4Event):void {
	 * 	trace(e);
	 * }
	 * </listing>
	 * 
	 * <p>Please note that this class will only work with encoders using the default (MAME) settings 
	 * and not with custom programs.</p>
	 * 
	 * <p><b>Limitations</b></p>
	 * 
	 * <p>Flash Player is currently unable to detect a KEY_DOWN or KEY_UP event for 
	 * the ALT key. This means that the input labeled "1SW2" (which uses the ALT key in the default 
	 * MAME configuration) does not work in Flash Player. In Adobe AIR, the "1SW2" input works 
	 * fine.</p>
	 * 
	 * <p>Also note that the 1SW4 input - which is assigned to the SHIFT key - will never be in 
	 * typematic mode. This is the behaviour of the SHIFT key on most modern operating systems and 
	 * has nothing to do with your board, Flash or this library.</p>
	 * 
	 * <p>The inputs labeled '3SW5', '3SW6', '3SW7', '3SW8', '4SW5', '4SW6', '4SW7' and '4SW8' are 
	 * not mapped in the default MAME configuration. Therefore, they cannot be used with this 
	 * library.</p>
	 * 
	 * <p>The inputs labeled '1SW4' and '3SW2' cannot be differentiated by Flash therefore they are
	 * bound together. The same goes for '1SW1' and '3SW1'.</p>
	 * 
	 * @see http://www.ultimarc.com
	 * @see cc.cote.jmulator.emulators.Emulator
	 * @see cc.cote.jmulator.events.IpacVeEvent
	 */
	public class Ipac4 extends Emulator 
	{

		/**
		 * Creates an Ipac4 object extending the base Emulator object. On top of inherited 
		 * properties, this object defines the board-specific mappings between input label and key 
		 * code generated.
		 * 
		 * @param listenOn 		An InteractiveObject to attach the keyboard listener to. Usually 
		 * 						this is the Stage.
		 * @param typematic 	Whether or not to use the OS typematic feature
		 * @param triggering 	The method to use to trigger events. Can be 
		 * 						EmulatorTriggerMode.TRIGGER_ON, EmulatorTriggerMode.TRIGGER_OFF or 
		 * 						EmulatorTriggerMode.TRIGGER_BOTH (default). TRIGGER_ON means to 
		 * 						dispatch the events only when the input is activated, TRIGGER_OFF 
		 * 						means to dispatch the events only when the input is deactivated and 
		 * 						TRIGGER_BOTH means to trigger events when the input is activated and 
		 * 						deactivated.
		 */			
		public function Ipac4(
			listenOn:InteractiveObject, 
			typematic:Boolean = false, 
			triggering:String = EmulatorTriggerMode.TRIGGER_BOTH
		) {
			
			super(listenOn, typematic, triggering);
			
			map[53]					= [Ipac4Event.INPUT_1COIN];							// 5
			map[54]					= [Ipac4Event.INPUT_2COIN];							// 6
					
			map[49] 				= [Ipac4Event.INPUT_1STRT];							// 1
			map[50] 				= [Ipac4Event.INPUT_2STRT];							// 2
					
			map[Keyboard.RIGHT] 	= [Ipac4Event.INPUT_1RGHT];							// right arrow
			map[Keyboard.LEFT] 		= [Ipac4Event.INPUT_1LEFT];							// left arrow
			map[Keyboard.UP] 		= [Ipac4Event.INPUT_1UP];							// up arrow
			map[Keyboard.DOWN] 		= [Ipac4Event.INPUT_1DOWN];							// down arrow
			
			// The alt key is only supported in AIR
			if (Capabilities.playerType == 'Desktop') {
				map[Keyboard.ALTERNATE]	= [Ipac4Event.INPUT_1SW2];						// left-alt		(18)
			} else {
				map['disabled']		= [Ipac4Event.INPUT_1SW2];
			}
			
			map[Keyboard.SPACE] 	= [Ipac4Event.INPUT_1SW3];							// space
			map[90]			 		= [Ipac4Event.INPUT_1SW5];							// z
			map[88]			 		= [Ipac4Event.INPUT_1SW6];							// x
			map[67]			 		= [Ipac4Event.INPUT_1SW7];							// c
			map[86]			 		= [Ipac4Event.INPUT_1SW8];							// v
			
			map[80]			 		= [Ipac4Event.INPUT_1A];							// p
			map[Keyboard.ENTER]		= [Ipac4Event.INPUT_1B, Ipac4Event.INPUT_3SW3];		// enter
			
			map[71] 				= [Ipac4Event.INPUT_2RGHT];							// g
			map[68] 				= [Ipac4Event.INPUT_2LEFT];							// d
			map[82] 				= [Ipac4Event.INPUT_2UP];							// r
			map[70] 				= [Ipac4Event.INPUT_2DOWN];							// f
				
			map[65] 				= [Ipac4Event.INPUT_2SW1];							// a
			map[83] 				= [Ipac4Event.INPUT_2SW2];							// s
			map[81] 				= [Ipac4Event.INPUT_2SW3];							// q
			map[87] 				= [Ipac4Event.INPUT_2SW4];							// w
			map[73]			 		= [Ipac4Event.INPUT_2SW5, Ipac4Event.INPUT_3UP];	// i
			map[75]			 		= [Ipac4Event.INPUT_2SW6, Ipac4Event.INPUT_3DOWN];	// k
			map[74]			 		= [Ipac4Event.INPUT_2SW7, Ipac4Event.INPUT_3LEFT];	// j
			map[76]			 		= [Ipac4Event.INPUT_2SW8, Ipac4Event.INPUT_3RGHT];	// l

			map[Keyboard.TAB]		= [Ipac4Event.INPUT_2A];							// tab
			map[Keyboard.ESCAPE]	= [Ipac4Event.INPUT_2B];							// esc

			map[55]					= [Ipac4Event.INPUT_3COIN];							// 7
			map[56]					= [Ipac4Event.INPUT_4COIN];							// 8
			
			map[51]					= [Ipac4Event.INPUT_3STRT];							// 3
			map[52]					= [Ipac4Event.INPUT_4STRT];							// 4
			
			map[79]					= [Ipac4Event.INPUT_3SW4];							// o
			
			map[85] 				= [Ipac4Event.INPUT_4RGHT];							// u
			map[86] 				= [Ipac4Event.INPUT_4LEFT];							// v
			map[89] 				= [Ipac4Event.INPUT_4UP];							// y
			map[78] 				= [Ipac4Event.INPUT_4DOWN];							// n
			
			map[66] 				= [Ipac4Event.INPUT_4SW1];							// b
			map[69] 				= [Ipac4Event.INPUT_4SW2];							// e
			map[72] 				= [Ipac4Event.INPUT_4SW3];							// h
			map[77] 				= [Ipac4Event.INPUT_4SW4];							// m			
			
			// Since Flash does not differentiate between LEFT-SHIFT and RIGHT-SHIFT those two 
			// inputs are forcefully bound together
			map[Keyboard.SHIFT] 	= [Ipac4Event.INPUT_1SW4, Ipac4Event.INPUT_3SW2];	// left-shift, right-shift
			
			// Since Flash does not differentiate between LEFT-CTRL and RIGHT-CTRL those two inputs 
			// are forcefully bound together
			map[Keyboard.CONTROL] 	= [Ipac4Event.INPUT_1SW1, Ipac4Event.INPUT_3SW1];	// left-ctrl, right-ctrl			
	
			// Those inputs are not mapped in the default MAME configuration, therefore we set them 
			// as disabled.
			map['disabled']			= [
				Ipac4Event.INPUT_3SW5, 
				Ipac4Event.INPUT_3SW6, 
				Ipac4Event.INPUT_3SW7, 
				Ipac4Event.INPUT_3SW8, 
				Ipac4Event.INPUT_4SW5, 
				Ipac4Event.INPUT_4SW6, 
				Ipac4Event.INPUT_4SW7, 
				Ipac4Event.INPUT_4SW8
			];
			
		}
		
	}
	
}
