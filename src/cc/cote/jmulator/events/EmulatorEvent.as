package cc.cote.jmulator.events
{
	import flash.events.Event;
	import flash.utils.getQualifiedClassName;

	/**
	 * An EmulatorEvent object is dispatched whenever the status of an input on a physical board 
	 * changes. Usually, this class is extended by board-specific classes. Therefore, this class is
	 * more of an abstract class.
	 * 
	 * @author Jean-Philippe Côté
	 */
	public class EmulatorEvent extends Event
	{
		
		/** A boolean that specifies if the input was activated (true) or deactivated (false) */
		public var status:Boolean;
		
		/** 
		 * A string that specifies which input triggered the event. This is useful, for example, 
		 * when using the ANY_INPUT event to know which input actually was the trigger. This 
		 * property is also useful because it represents the board input as it is labeled (in 
		 * lowercase and without the 'input_' prefix).
		 */
		public var input:String;
		
		/**
		 * Constructs an EmulatorEvent object. 
		 * 
		 * @param type 			The type of the event. It's usually the name of the board label 
		 * 						(lowercase) prepended with 'input_'.
		 * @param status 		The boolean status of the event. True means the input was activated 
		 * 						(on) and false means the input was deactivated (off).
		 * @param input 		The exact board label name of the input that triggered the event. 
		 * @param bubbles 		Indicates whether an event is a bubbling event.
		 * @param cancelable 	Indicates whether the behavior associated with the event can be 
		 * 						prevented.
		 */
		public function EmulatorEvent(
			type:String, 
			status:Boolean, 
			input:String = '', 
			bubbles:Boolean = false, 
			cancelable:Boolean = false
		):void {
			
			super(type, bubbles, cancelable);
			
			this.status = status;
			
			if (input == '') {
				this.input = type;
			} else {
				this.input = input;
			}
			
		}
	
		/** 
		 * Returns a string representation of the event and associated properties. This is mostly 
		 * useful for debugging.
		 */
		public override function toString():String { 
		    return formatToString(
				getQualifiedClassName(this).split("::").pop(), 
				'type', 
				'status', 
		    	'input', 
				'bubbles', 
				'cancelable', 
				'eventPhase'
			); 
		}
		
	}

}

