package cc.cote.jmulator 
{
	import flash.ui.Keyboard;
	import flash.display.InteractiveObject;
	import flash.events.EventDispatcher;
	import flash.events.KeyboardEvent;
	import flash.utils.Dictionary;
    
	/**
	 * The Emulator class is an abstract class which is used, and extended by, 
	 * the classes in the the <code>emulators</code> sub-package. It provides 
	 * various functionalities to simplify the process of working with keyboard 
	 * emulators (also called encoders). By using one of its subclasses, you 
	 * will be freed from researching keyboard codes. You will be able to simply 
	 * listen to events bearing the same names as the labels on the board you 
	 * use. The class also offers additional functionalities such as selective 
	 * typematic management and the choice between receiving all events, only ON 
	 * events or only OFF events.
	 *  
	 * @author Jean-Philippe Côté
	 * @version 1.0b rev3
	 * @see http://www.cote.cc/jmulator Jmulator website
	 * @see cc.cote.jmulator.EmulatorEvent EmulatorEvent class
	 * @see cc.cote.jmulator.emulators Emulators package
	 * 
	 * @todo Allow typematic changes after the object is created (with a setter)
	 * @todo Include a functionality to selectively exclude keyups and keydowns
	 * @todo Allow typematic feature on a per keyCode basis
	 * 
	 * @todo Add support for additional keyboard emulators/encoders. Here are a 
	 * few that could be added :
	 * 
	 * 		- http://www.groovygamegear.com/screenshots.html
	 * 		- http://www.hagstromelectronics.com/products/modules.html
	 * 		- http://www.vetra.com/Encoder2.htm
	 * 		- http://www.piengineering.com/custom/xkmatrix.php
	 * 		- http://www.happcontrols.com/joysticks/950800xx.htm
	 * 		- http://www.audon.co.uk/kbe-629.html
	 */
	public class Emulator extends EventDispatcher
	{		
		/**
		 * Constant associated with any input. Allows listening to all inputs at
		 * once. Since static properties are not inherited, it also needs to be 
		 * defined in board classes.
		 */
		public static const INPUT_ANY:String = 'any';
		
		/** 
		 * A string constant to specify that both "on" and "off" states should 
		 * be triggering the dispatch of events
		 */
		public static const TRIGGER_BOTH:String = "both";
		
		/** 
		 * A string constant to specify that only "on" states should be 
		 * triggering the dispatch of events
		 */
		public static const TRIGGER_ON:String = "on";
		
		/** 
		 * A string constant to specify that only "off" states should be 
		 * triggering the dispatch of events
		 */
		public static const TRIGGER_OFF:String = "off";
		
		/** 
		 * A string that identifies which type of events should be triggered by 
		 * the Emulator object. It can be set to trigger events when inputs are 
		 * activated only, when they are deactivated only or on both activation 
		 * and deactivation (TRIGGER_ON, TRIGGER_OFF or TRIGGER_BOTH).
		 *
		 * @default TRIGGER_BOTH
		 */
		public var triggering:String = TRIGGER_BOTH;
		
		/** 
		 * A boolean specifying whether or not to ignore the OS typematic 
		 * feature. If typematic is enabled (it usually is), a stream of 
		 * identical characters is generated when the user holds down a key for 
		 * a period of time.
		 * 
		 * @default false
		 */
		public var typematic:Boolean = false;
		
		/** 
		 * An array to keep track of currently activated keys. It is used by the 
		 * typematic disabling feature to know which repeated activations should 
		 * be ignored.
		 */
		private var _activatedInputs:Array = new Array();
		
		/** 
		 * A Dictionary object that specifies the mappings between key codes (as 
		 * sent by the board) and event names
		 */
		public var map:Dictionary = new Dictionary();
																	
		/**
		 * The Emulator class simplifies interfacing with a variety of keyboard 
		 * emulators/encoders
		 * 
		 * @param listenOn An InteractiveObject to attach the keyboard listener 
		 * to. Usually this is the Stage.
		 * @param typematic Whether or not to use the OS typematic feature. When 
		 * the typematic feature is enabled, the OS repeatedly sends keydown 
		 * events when a key is being held down
		 * @param triggering Triggering method : on button press only (TRIGGER_ON), 
		 * on button release only (TRIGGER_OFF) or on both press and release 
		 * (TRIGGER_BOTH)
		 * @throws Error The Emulator class cannot be instantiated directly. Use 
		 * a subclass from the emulators package
		 */		
		public function Emulator(listenOn:InteractiveObject, 
				typematic:Boolean = true, triggering:String = 'both'):void {
										
			// Enforce the fact that this class is abstract and should not be
			// instantiated directly
			if (Object(this).constructor == Emulator) {
				throw( 
					new Error("The Emulator class cannot be instantiated directly. Use a subclass from the emulators package.")
					);
			}
			
			/*
			if (listenOn == null) {
				throw(
					new Error('The "listenOn" parameter cannot be null. It is needed to register global keyboard events.')
					);
			}
			*/
			
			// Store parameters in object properties
			this.typematic = typematic;
			this.triggering = triggering;
			
			// Add keyboard listeners
			listenOn.addEventListener(KeyboardEvent.KEY_DOWN, _onKeyDown);
			listenOn.addEventListener(KeyboardEvent.KEY_UP, _onKeyUp);
			
		}

		/**
		 * Parses the KEY_DOWN events received from the KeyboardEvent object and 
		 * dispatches this classe's custom events when appropriate.
		 *
		 * @param e KeyboardEvent object
		 */	
		private function _onKeyDown(e:KeyboardEvent):void {			

			// Try to fetch string for that code. If it fails, return immediately
			var events:Array = _getEvents(e.keyCode);
			if (!events) return;
			
			// Loop through all events found for the keyCode
			var i:uint = 0;
			for each (var s:String in events) {
			
				// Dispatch event, or not, based on the typematic setting
				if (typematic) {

					if (triggering == TRIGGER_ON || triggering == TRIGGER_BOTH) {
						dispatchEvent(new EmulatorEvent(s, true));
						// Dispatch 'any' event which allows listening to all keys at once
						dispatchEvent(new EmulatorEvent(INPUT_ANY, true, s));
					}
					
				} else {
					
					// If the keyCode is not already active, dispatch the event 
					// only if triggering mode is set to ON or BOTH)
					if (_activatedInputs.indexOf(e.keyCode) < 0 && (triggering == TRIGGER_BOTH || triggering == TRIGGER_ON)) {
						dispatchEvent(new EmulatorEvent(s, true));
						// Dispatch 'any' event which allows listening to all keys at once
						dispatchEvent(new EmulatorEvent(INPUT_ANY, true, s));
					} else {
						// If the keyCode is already active but there is more than one event for that keycode
						if ( i > 0 && (triggering == TRIGGER_BOTH || triggering == TRIGGER_ON) ) {
							dispatchEvent(new EmulatorEvent(s, true));
							// Dispatch 'any' event which allows listening to all keys at once
							dispatchEvent(new EmulatorEvent(INPUT_ANY, true, s));
						}
					}
					
				}
				
				// If the keyCode is not already in the activated list, add it
				if (_activatedInputs.indexOf(e.keyCode) < 0 ) {
						_activatedInputs.push(e.keyCode);
				}
				
				i++;
				
			}
			
		}
		
		/**
		 * Parses the KEY_UP events received from the KeyboardEvent object and 
		 * dispatches this classe's custom events when appropriate.
		 * 
		 * @param e KeyboardEvent object
		 */				
		private function _onKeyUp(e:KeyboardEvent):void {
			
			// Try to fetch events associated with that code. If it fails, 
			// return immediately
			var events:Array = _getEvents(e.keyCode);
			if (!events) return;
			
			// Loop through each event found
			for each (var s:String in events) {
			
				if (triggering == TRIGGER_OFF || triggering == TRIGGER_BOTH) {
					dispatchEvent(new EmulatorEvent(s, false));
					// Dispatch 'any' event which allows listening to all keys at once
					dispatchEvent(new EmulatorEvent(INPUT_ANY, false, s));
				}
				
				// Always remove the keyCode from the list of activated keyCodes
				var pos:int = _activatedInputs.indexOf(e.keyCode);
				_activatedInputs.splice(pos, 1);
				
			}
			
		}
		
		/**
		 * Retrieves an array of all the emulator event(s) registered to a 
		 * specific key code. On certain emulators (the I-PAC for example), 
		 * there can be more than one input registered to a single key code.
		 * 
		 * The value 'disabled' can also be passed as a parameter to lookup 
		 * disabled key codes for the board.
		 * 
		 * @param keyCode Keyboard keycode (ascii code)
		 * @return An array of emulator event types
		 */				
		private function _getEvents(keyCode:*):Array {	
			return map[keyCode];
		}	
			
		/**
		 * Retrieves the key code associated with a specific board input
		 * 
		 * @param input Board input label
		 * @return An array of emulator event types
		 */				
		private function _getKeyCode(input:String):uint {	
			
			// Loop through all arrays associated with all keys to find one the 
			// key associated with the requested input.
			for (var key:* in map) {
				
				var i:uint = 0;
				for each (var s:String in map[key]) {
					if (s == input) { return key; }
				}
				i++;

			}
			
			// If nothing is found 
			return 0;

		}
		
		/**
		 * Returns the current status (activated or not) of a specific board 
		 * input
		 * 
		 * @param input Board input label
		 * @return A boolean indicating if the input is in active mode (true) or 
		 * inactive mode (false)
		 */		
		public function isActive(input:String):Boolean {

			var code:uint = _getKeyCode(input);
			
			if (_activatedInputs.indexOf(code) == -1) {
				return false;
			} else {
				return true;
			}

		}
	
		/**
		 * Indicates if the capsLock key is currently engaged (true) or not 
		 * (false)
		 * 
		 * @return A boolean indicating if the capsLock key is currently 
		 *		   engaged (true) or not (false)
		 */
		public function get capsLock():Boolean {
			return Keyboard.capsLock;
		}
		
		/**
		 * Indicates if the numLock key is currently engaged (true) or not 
		 * (false)
		 *
		 * @return A boolean indicating if the numLock key is currently 
		 *		   engaged (true) or not (false)
		 */
		public function get numLock():Boolean {
			return Keyboard.numLock;
		}
		
		/**
		 * A JSON representation of the board label to keyboard key mappings 
		 * (useful for debugging)
		 */
		public function get jsonLabelMap():String {
			
			// Create string to hold output
			var json:String = '';
			
			// Count number of items in Dictionary for later use
			var n:int = 0;
			for (var k:* in map) n++;
			
			// Iterate through all items in the Dictionary keeping track of
			// iterations
			var i:uint = 0;
			for (var key:Object in map) {				

				json += "\t";
				
				if (key is Number) {
					json += map[key].toString() + ': ' + _convertToJson(String.fromCharCode(key));
				} else if (key == 'disabled') {
					json += map[key].toString() + ': false';
				}
				
				if (i < n - 1) json += ",\n";
				
				i++;
			}
			
			return "{\n" + json + "\n}";
		}
				
		/**
		 * Encodes string into JSON-compatible format. 
		 * 
		 * This function 
		 * has been extracted from the JSONEncoder.as class written by 
		 * Lawrence S. Maccherone which I believed is itself derived 
		 * from the as3corelib library.
		 *
		 * @param str The string to encode
		 * @return a JSON-encoded version of the input string
		 */
		private function _convertToJson(str:String):String {
			
			// Variable to hold the json output
			var json:String = "";
			
			// Character currently being processed
			var char:String;
			
			// Check all characters and encode them if necessary
			for (var i:uint = 0; i < str.length; i++) {
			
				char = str.charAt(i);
				
				switch ( char ) {
				
					case '"':	// quotation mark
						json += "\\\"";
						break;
						
					case '/':	// solidus
						json += "\\/";
						break;
						
					case '\\':	// reverse solidus
						json += "\\\\";
						break;
						
					case '\b':	// bell
						json += "\\b";
						break;
						
					case '\f':	// form feed
						json += "\\f";
						break;
						
					case '\n':	// newline
						json += "\\n";
						break;
						
					case '\r':	// carriage return
						json += "\\r";
						break;
						
					case '\t':	// horizontal tab
						json += "\\t";
						break;
						
					default:	// everything else
						
						// check for a control character and escape as unicode
						if ( char < ' ' ) {
							// get the hex digit(s) of the character (either 1 or 2 digits)
							var hexCode:String = char.charCodeAt( 0 ).toString( 16 );
							
							// ensure that there are 4 digits by adjusting
							// the # of zeros accordingly.
							var zeroPad:String = hexCode.length == 2 ? "00" : "000";
							
							// create the unicode escape sequence with 4 hex digits
							json += "\\u" + zeroPad + hexCode;
						} else {
						
							// no need to do any special encoding, just pass-through
							json += char;
							
						}
				}
				
			}
						
			return '"' + json + '"';
		}
			
	}
	
}
