package cc.cote.jmulator
{
	import flash.events.Event;

	/**
	 * An EmulatorEvent object is dispatched whenever the status of an input on
	 * the physical board changes. The name of the dispatched event is exactly 
	 * the name of the input (as labeled on the board itself).
	 * 
	 * @author Jean-Philippe Côté
	 */
	public class EmulatorEvent extends Event
	{
		/** 
		 * A boolean that specifies if the input was activated (true) or 
		 * deactivated (false)
		 */
		public var status:Boolean;
		
		/** 
		 * A string that specifies which input triggered the event. This is 
		 * useful, for example, when using the INPUT_ANY event to differentiate
		 * which input actually was the trigger. In any other cases, it is the 
		 * same as the event type.
		 */
		public var input:String;
		
		/**
		 * Constructs an EmulatorEvent object. 
		 * 
		 * @param type The type of the event. Usually matches the name of the 
		 * board input label
		 * @param status The boolean status of the event. True means the input 
		 * was activated (on) and false means the input was deactivated (off)
		 * @param input The board label name of the input that triggered the 
		 * event. This is the same as the 'type' unless you are using the 
		 * INPUT_ANY event
		 * @param bubbles Indicates whether an event is a bubbling event.
		 * @param cancelable Indicates whether the behavior associated with the 
		 * event can be prevented.
		 */
		public function EmulatorEvent(type:String, status:Boolean, 
							input:String = '', bubbles:Boolean = false, 
							cancelable:Boolean = false):void {
			
			super(type, bubbles, cancelable);
			
			this.status = status;
			
			if (input == '') {
				this.input = type;
			} else {
				this.input = input;
			}
			
		}
	
		/** 
		 * Utility function overriding the default toString() function to include
		 * specific properties such as 'status' and 'input'.
		 * @return A string representation of the event 
		 */
		public override function toString():String { 
		    return formatToString('EmulatorEvent', 'type', 'status', 
		    					'input', 'bubbles', 'cancelable', 'eventPhase'); 
		}
		
		
	}
}










