package cc.cote.jmulator.emulators 
{
	import flash.display.InteractiveObject;
	import flash.system.Capabilities;
	import flash.ui.Keyboard;
	
	import cc.cote.jmulator.events.Ipac2Event;
	import cc.cote.jmulator.events.IpacVeEvent;

	/**
	 * Dispatched when any of the board's input changes.
	 * @eventType cc.cote.jmulator.events.Ipac2Event.ANY_INPUT
	 */
	[Event(name="anyInput", type="cc.cote.jmulator.events.Ipac2Event")]
	
	/**
	 * Dispatched when there is a change on the board input labeled "1RGHT"
	 * @eventType cc.cote.jmulator.events.Ipac2Event.INPUT_1RGHT
	 */
	[Event(name="input_1rght", type="cc.cote.jmulator.events.Ipac2Event")]
	
	/**
	 * Dispatched when there is a change on the board input labeled "1LEFT"
	 * @eventType cc.cote.jmulator.events.Ipac2Event.INPUT_1LEFT
	 */
	[Event(name="input_1left", type="cc.cote.jmulator.events.Ipac2Event")]
	
	/**
	 * Dispatched when there is a change on the board input labeled "1UP"
	 * @eventType cc.cote.jmulator.events.Ipac2Event.INPUT_1UP
	 */
	[Event(name="input_1up", type="cc.cote.jmulator.events.Ipac2Event")]
	
	/**
	 * Dispatched when there is a change on the board input labeled "1DOWN"
	 * @eventType cc.cote.jmulator.events.Ipac2Event.INPUT_1DOWN
	 */
	[Event(name="input_1down", type="cc.cote.jmulator.events.Ipac2Event")]
	
	/**
	 * Dispatched when there is a change on the board input labeled "1SW1"
	 * @eventType cc.cote.jmulator.events.Ipac2Event.INPUT_1SW1
	 */
	[Event(name="input_1sw1", type="cc.cote.jmulator.events.Ipac2Event")]
	
	/**
	 * Dispatched when there is a change on the board input labeled "1SW2"
	 * @eventType cc.cote.jmulator.events.Ipac2Event.INPUT_1SW2
	 */
	[Event(name="input_1sw2", type="cc.cote.jmulator.events.Ipac2Event")]
	
	/**
	 * Dispatched when there is a change on the board input labeled "1SW3"
	 * @eventType cc.cote.jmulator.events.Ipac2Event.INPUT_1SW3
	 */
	[Event(name="input_1sw3", type="cc.cote.jmulator.events.Ipac2Event")]
	
	/**
	 * Dispatched when there is a change on the board input labeled "1SW4"
	 * @eventType cc.cote.jmulator.events.Ipac2Event.INPUT_1SW4
	 */
	[Event(name="input_1sw4", type="cc.cote.jmulator.events.Ipac2Event")]
	
	/**
	 * 	Dispatched when there is a change on the board input labeled "1SW5"
	 * @eventType cc.cote.jmulator.events.Ipac2Event.INPUT_1SW5
	 */
	[Event(name="input_1sw5", type="cc.cote.jmulator.events.Ipac2Event")]
	
	/**
	 * Dispatched when there is a change on the board input labeled "1SW6"
	 * @eventType cc.cote.jmulator.events.Ipac2Event.INPUT_1SW6
	 */
	[Event(name="input_1sw6", type="cc.cote.jmulator.events.Ipac2Event")]
	
	/**
	 * Dispatched when there is a change on the board input labeled "1SW7"
	 * @eventType cc.cote.jmulator.events.Ipac2Event.INPUT_1SW7
	 */
	[Event(name="input_1sw7", type="cc.cote.jmulator.events.Ipac2Event")]
	
	/**
	 * Dispatched when there is a change on the board input labeled "1SW8"
	 * @eventType cc.cote.jmulator.events.Ipac2Event.INPUT_1SW8
	 */
	[Event(name="input_1sw8", type="cc.cote.jmulator.events.Ipac2Event")]
	
	/**
	 * 	Dispatched when there is a change on the board input labeled "1STRT"
	 * @eventType cc.cote.jmulator.events.Ipac2Event.INPUT_1STRT
	 */
	[Event(name="input_1strt", type="cc.cote.jmulator.events.Ipac2Event")]
	
	/**
	 * Dispatched when there is a change on the board input labeled "1COIN"
	 * @eventType cc.cote.jmulator.events.Ipac2Event.INPUT_1COIN
	 */
	[Event(name="input_1coin", type="cc.cote.jmulator.events.Ipac2Event")]
	
	/**
	 * Dispatched when there is a change on the board input labeled "1A"
	 * @eventType cc.cote.jmulator.events.Ipac2Event.INPUT_1A
	 */
	[Event(name="input_1a", type="cc.cote.jmulator.events.Ipac2Event")]
	
	/**
	 * Dispatched when there is a change on the board input labeled "1B"
	 * @eventType cc.cote.jmulator.events.Ipac2Event.INPUT_1B
	 */
	[Event(name="input_1b", type="cc.cote.jmulator.events.Ipac2Event")]
	
	/**
	 * Dispatched when there is a change on the board input labeled "2RGHT"
	 * @eventType cc.cote.jmulator.events.Ipac2Event.INPUT_2RGHT
	 */
	[Event(name="input_2rght", type="cc.cote.jmulator.events.Ipac2Event")]
	
	/**
	 * Dispatched when there is a change on the board input labeled "2LEFT"
	 * @eventType cc.cote.jmulator.events.Ipac2Event.INPUT_2LEFT
	 */
	[Event(name="input_2left", type="cc.cote.jmulator.events.Ipac2Event")]
	
	/**
	 * Dispatched when there is a change on the board input labeled "2UP"
	 * @eventType cc.cote.jmulator.events.Ipac2Event.INPUT_2UP
	 */
	[Event(name="input_2up", type="cc.cote.jmulator.events.Ipac2Event")]
	
	/**
	 * Dispatched when there is a change on the board input labeled "2DOWN"
	 * @eventType cc.cote.jmulator.events.Ipac2Event.INPUT_2DOWN
	 */
	[Event(name="input_2down", type="cc.cote.jmulator.events.Ipac2Event")]
	
	/**
	 * Dispatched when there is a change on the board input labeled "2SW1"
	 * @eventType cc.cote.jmulator.events.Ipac2Event.INPUT_2SW1
	 */
	[Event(name="input_2sw1", type="cc.cote.jmulator.events.Ipac2Event")]
	
	/**
	 * Dispatched when there is a change on the board input labeled "2SW2"
	 * @eventType cc.cote.jmulator.events.Ipac2Event.INPUT_2SW2
	 */
	[Event(name="input_2sw2", type="cc.cote.jmulator.events.Ipac2Event")]
	
	/**
	 * Dispatched when there is a change on the board input labeled "2SW3"
	 * @eventType cc.cote.jmulator.events.Ipac2Event.INPUT_2SW3
	 */
	[Event(name="input_2sw3", type="cc.cote.jmulator.events.Ipac2Event")]
	
	/**
	 * Dispatched when there is a change on the board input labeled "2SW4"
	 * @eventType cc.cote.jmulator.events.Ipac2Event.INPUT_2SW4
	 */
	[Event(name="input_2sw4", type="cc.cote.jmulator.events.Ipac2Event")]
	
	/**
	 * Dispatched when there is a change on the board input labeled "2SW5"
	 * @eventType cc.cote.jmulator.events.Ipac2Event.INPUT_2SW5
	 */
	[Event(name="input_2sw5", type="cc.cote.jmulator.events.Ipac2Event")]
	
	/**
	 * Dispatched when there is a change on the board input labeled "2SW6"
	 * @eventType cc.cote.jmulator.events.Ipac2Event.INPUT_2SW6
	 */
	[Event(name="input_2sw6", type="cc.cote.jmulator.events.Ipac2Event")]
	
	/**
	 * Dispatched when there is a change on the board input labeled "2SW7"
	 * @eventType cc.cote.jmulator.events.Ipac2Event.INPUT_2SW7
	 */
	[Event(name="input_2sw7", type="cc.cote.jmulator.events.Ipac2Event")]
	
	/**
	 * Dispatched when there is a change on the board input labeled "2SW8"
	 * @eventType cc.cote.jmulator.events.Ipac2Event.INPUT_2SW8
	 */
	[Event(name="input_2sw8", type="cc.cote.jmulator.events.Ipac2Event")]
	
	/**
	 * Dispatched when there is a change on the board input labeled "2STRT"
	 * @eventType cc.cote.jmulator.events.Ipac2Event.INPUT_2STRT
	 */
	[Event(name="input_2strt", type="cc.cote.jmulator.events.Ipac2Event")]
	
	/**
	 * Dispatched when there is a change on the board input labeled "2COIN"
	 * @eventType cc.cote.jmulator.events.Ipac2Event.INPUT_2COIN
	 */
	[Event(name="input_2coin", type="cc.cote.jmulator.events.Ipac2Event")]
	
	/**
	 * Dispatched when there is a change on the board input labeled "2A"
	 * @eventType cc.cote.jmulator.events.Ipac2Event.INPUT_2A
	 */
	[Event(name="input_2a", type="cc.cote.jmulator.events.Ipac2Event")]
	
	/**
	 * Dispatched when there is a change on the board input labeled "2B"
	 * @eventType cc.cote.jmulator.events.Ipac2Event.INPUT_2B
	 */
	[Event(name="input_2b", type="cc.cote.jmulator.events.Ipac2Event")]
	
	/**
	 * The Ipac2 class defines the characteristics of the I-PAC 2 board made by Ultimarc. It 
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
	 * import cc.cote.jmulator.emulators.Ipac2;
	 * import cc.cote.jmulator.events.Ipac2Event;
	 * 
	 * var emu:Ipac2 = new Ipac2(stage);
	 * emu.addEventListener(Ipac2Event.INPUT_2COIN, test);
	 * 
	 * function test(e:Ipac2Event):void {
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
	 * @see http://www.ultimarc.com
	 * @see cc.cote.jmulator.emulators.Emulator
	 * @see cc.cote.jmulator.events.Ipac2Event
	 */
	public class Ipac2 extends Emulator 
	{

		/**
		 * Creates an Ipac2 object extending the base <code>Emulator</code> object. On top of 
		 * inherited properties, this object defines the board-specific mappings between the label 
		 * and key codes generated.
		 * 
		 * @param listenOn 		An InteractiveObject to attach the keyboard listener to. Usually 
		 * 						this is the Stage.
		 * @param typematic 	Whether or not to let the OS' typematic feature send multiple 
		 * 						events.
		 * @param triggering 	The method to use to trigger events. Can be one of 
		 * 						EmulatorTriggerMode.TRIGGER_ON, EmulatorTriggerMode.TRIGGER_OFF or 
		 * 						EmulatorTriggerMode.TRIGGER_BOTH (default). TRIGGER_ON means to 
		 * 						dispatch the events only when the input is activated, TRIGGER_OFF 
		 * 						means to dispatch the events only when the input is deactivated and 
		 * 						TRIGGER_BOTH means to trigger events when the input is activated and 
		 * 						deactivated.
		 * 
		 * @see cc.cote.jmulator.emulators.EmulatorTriggerMode
		 * @see cc.cote.jmulator.emulators.Emulator
		 * @see cc.cote.jmulator.events.Ipac2Event
		 */			
		public function Ipac2(
			listenOn:InteractiveObject, 
			typematic:Boolean = false, 
			triggering:String = EmulatorTriggerMode.TRIGGER_BOTH
		) {
			
			super(listenOn, typematic, triggering);
			
			map[Keyboard.RIGHT] 	= [Ipac2Event.INPUT_1RGHT];			// right arrow 	(39)
			map[Keyboard.LEFT] 		= [Ipac2Event.INPUT_1LEFT];			// left arrow 	(37)
			map[Keyboard.UP] 		= [Ipac2Event.INPUT_1UP];			// up arrow 	(38)
			map[Keyboard.DOWN] 		= [Ipac2Event.INPUT_1DOWN];			// down arrow 	(40)
			
			map[Keyboard.CONTROL] 	= [Ipac2Event.INPUT_1SW1];			// left-ctrl 	(17)
			
			// The alt key is only supported in AIR
			if (Capabilities.playerType == 'Desktop') {
				map[Keyboard.ALTERNATE]	= [IpacVeEvent.INPUT_1SW2];		// left-alt		(18)
			} else {
				map['disabled']		= [IpacVeEvent.INPUT_1SW2];
			}
			
			map[Keyboard.SPACE] 	= [Ipac2Event.INPUT_1SW3];			// space 		(32)
			map[Keyboard.SHIFT] 	= [Ipac2Event.INPUT_1SW4];			// left-shift 	(16)
			map[90]			 		= [Ipac2Event.INPUT_1SW5];			// z
			map[88]			 		= [Ipac2Event.INPUT_1SW6];			// x
			map[67]			 		= [Ipac2Event.INPUT_1SW7];			// c
			map[86]			 		= [Ipac2Event.INPUT_1SW8];			// v
			
			map[49] 				= [Ipac2Event.INPUT_1STRT];			// 1
			map[53]					= [Ipac2Event.INPUT_1COIN];			// 5
			
			map[80]			 		= [Ipac2Event.INPUT_1A];			// p
			map[Keyboard.ENTER]		= [Ipac2Event.INPUT_1B];			// enter	 	(13)
			
			map[71] 				= [Ipac2Event.INPUT_2RGHT];			// g
			map[68] 				= [Ipac2Event.INPUT_2LEFT];			// d
			map[82] 				= [Ipac2Event.INPUT_2UP];			// r
			map[70] 				= [Ipac2Event.INPUT_2DOWN];			// f
			
			map[65] 				= [Ipac2Event.INPUT_2SW1];			// a
			map[83] 				= [Ipac2Event.INPUT_2SW2];			// s
			map[81] 				= [Ipac2Event.INPUT_2SW3];			// q
			map[87] 				= [Ipac2Event.INPUT_2SW4];			// w
			map[73]			 		= [Ipac2Event.INPUT_2SW5];			// i
			map[75]			 		= [Ipac2Event.INPUT_2SW6];			// k
			map[74]			 		= [Ipac2Event.INPUT_2SW7];			// j
			map[76]			 		= [Ipac2Event.INPUT_2SW8];			// l
			
			map[54]					= [Ipac2Event.INPUT_2COIN];			// 6
			map[50] 				= [Ipac2Event.INPUT_2STRT];			// 2
			
			map[Keyboard.TAB]		= [Ipac2Event.INPUT_2A];			// tab 			(9)
			map[Keyboard.ESCAPE]	= [Ipac2Event.INPUT_2B];			// esc 			(27)
			
		}
		
	}
	
}
