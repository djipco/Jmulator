package cc.cote.jmulator.events
{
	
	/**
	 * An Ipac2Event object is dispatched whenever the status of an input on an Ipac2 board 
	 * changes. The name of the dispatched event is exactly the name of the input (as labeled on the 
	 * board itself).
	 * 
	 * @author Jean-Philippe Côté
	 * @since version 2.0b
	 */
	public class Ipac2Event extends EmulatorEvent
	{
		
		/**
		 * The <code>ANY_INPUT</code> constant defines the value of the <code>type</code> property 
		 * of a <code>anyInput</code> event object.
		 * 	
		 * @eventType anyInput
		 */
		public static const ANY_INPUT:String = 'anyInput';
		
		/**
		 * The <code>INPUT_1RGHT</code> constant defines the value of the <code>type</code> property 
		 * of a <code>input_1rght</code> event object.
		 * 
		 * @eventType input_1rght
		 */
		public static const INPUT_1RGHT:String = 'input_1rght';
		
		/**
		 * The <code>INPUT_1LEFT</code> constant defines the value of the <code>type</code> property 
		 * of a <code>input_1left</code> event object.
		 * 
		 * @eventType input_1left
		 */
		public static const INPUT_1LEFT:String = 'input_1left';
		
		/**
		 * The <code>INPUT_1UP</code> constant defines the value of the <code>type</code> property 
		 * of a <code>input_1up</code> event object.
		 * 
		 * @eventType input_1up
		 */
		public static const INPUT_1UP:String = 'input_1up';
		
		/**
		 * The <code>INPUT_1DOWN</code> constant defines the value of the <code>type</code> property 
		 * of a <code>input_1down</code> event object.
		 * 
		 * @eventType input_1down
		 */
		public static const INPUT_1DOWN:String = 'input_1down';
		
		/**
		 * The <code>INPUT_1SW1</code> constant defines the value of the <code>type</code> property 
		 * of a <code>input_1sw1</code> event object.
		 * 
		 * @eventType input_1sw1
		 */
		public static const INPUT_1SW1:String = 'input_1sw1';
		
		/**
		 * The <code>INPUT_1SW2</code> constant defines the value of the <code>type</code> property 
		 * of a <code>input_1sw2</code> event object.
		 * 
		 * @eventType input_1sw2
		 */
		public static const INPUT_1SW2:String = 'input_1sw2';
		
		/**
		 * The <code>INPUT_1SW3</code> constant defines the value of the <code>type</code> property 
		 * of a <code>input_1sw3</code> event object.
		 * 
		 * @eventType input_1sw3
		 */
		public static const INPUT_1SW3:String = 'input_1sw3';
		
		/**
		 * The <code>INPUT_1SW4</code> constant defines the value of the <code>type</code> property 
		 * of a <code>input_1sw4</code> event object.
		 * 
		 * @eventType input_1sw4
		 */
		public static const INPUT_1SW4:String = 'input_1sw4';
		
		/**
		 * The <code>INPUT_1SW5</code> constant defines the value of the <code>type</code> property 
		 * of a <code>input_1sw5</code> event object.
		 * 	
		 * @eventType input_1sw5
		 */
		public static const INPUT_1SW5:String = 'input_1sw5';
		
		/**
		 * The <code>INPUT_1SW6</code> constant defines the value of the <code>type</code> property 
		 * of a <code>input_1sw6</code> event object.
		 * 	
		 * @eventType input_1sw6
		 */
		public static const INPUT_1SW6:String = 'input_1sw6';
		
		/**
		 * The <code>INPUT_1SW7</code> constant defines the value of the <code>type</code> property 
		 * of a <code>input_1sw7</code> event object.
		 * 	
		 * @eventType input_1sw7
		 */
		public static const INPUT_1SW7:String = 'input_1sw7';
		
		/**
		 * The <code>INPUT_1SW8</code> constant defines the value of the <code>type</code> property 
		 * of a <code>input_1sw8</code> event object.
		 * 	
		 * @eventType input_1sw8
		 */
		public static const INPUT_1SW8:String = 'input_1sw8';
		
		/**
		 * The <code>INPUT_1STRT</code> constant defines the value of the <code>type</code> property 
		 * of a <code>input_1strt</code> event object.
		 * 	
		 * @eventType input_1strt
		 */
		public static const INPUT_1STRT:String = 'input_1strt';
		
		/**
		 * The <code>INPUT_1COIN</code> constant defines the value of the <code>type</code> property 
		 * of a <code>input_1coin</code> event object.
		 * 	
		 * @eventType input_1coin
		 */
		public static const INPUT_1COIN:String = 'input_1coin';
		
		/**
		 * The <code>INPUT_1A</code> constant defines the value of the <code>type</code> property of 
		 * a <code>input_1a</code> event object.
		 * 	
		 * @eventType input_1a
		 */
		public static const INPUT_1A:String = 'input_1a';
		
		/**
		 * The <code>INPUT_1B</code> constant defines the value of the <code>type</code> property of 
		 * a <code>input_1b</code> event object.
		 * 	
		 * @eventType input_1b
		 */
		public static const INPUT_1B:String = 'input_1b';
		
		/**
		 * The <code>INPUT_2RGHT</code> constant defines the value of the <code>type</code> property 
		 * of a <code>input_2rght</code> event object.
		 * 	
		 * @eventType input_2rght
		 */
		public static const INPUT_2RGHT:String = 'input_2rght';
		
		/**
		 * The <code>INPUT_2LEFT</code> constant defines the value of the <code>type</code> property 
		 * of a <code>input_2left</code> event object.
		 * 	
		 * @eventType input_2left
		 */
		public static const INPUT_2LEFT:String = 'input_2left';
		
		/**
		 * The <code>INPUT_2UP</code> constant defines the value of the <code>type</code> property 
		 * of a <code>input_2up</code> event object.
		 * 	
		 * @eventType input_2up
		 */
		public static const INPUT_2UP:String = 'input_2up';
		
		/**
		 * The <code>INPUT_2DOWN</code> constant defines the value of the <code>type</code> property 
		 * of a <code>input_2down</code> event object.
		 * 	
		 * @eventType input_2down
		 */
		public static const INPUT_2DOWN:String = 'input_2down';
		
		/**
		 * The <code>INPUT_2SW1</code> constant defines the value of the <code>type</code> property 
		 * of a <code>input_2sw1</code> event object.
		 * 	
		 * @eventType input_2sw1
		 */
		public static const INPUT_2SW1:String = 'input_2sw1';
		
		/**
		 * The <code>INPUT_2SW2</code> constant defines the value of the <code>type</code> property 
		 * of a <code>input_2sw2</code> event object.
		 * 	
		 * @eventType input_2sw2
		 */
		public static const INPUT_2SW2:String = 'input_2sw2';
		
		/**
		 * The <code>INPUT_2SW3</code> constant defines the value of the <code>type</code> property 
		 * of a <code>input_2sw3</code> event object.
		 * 	
		 * @eventType input_2sw3
		 */
		public static const INPUT_2SW3:String = 'input_2sw3';
		
		/**
		 * The <code>INPUT_2SW4</code> constant defines the value of the <code>type</code> property 
		 * of a <code>input_2sw4</code> event object.
		 * 	
		 * @eventType input_2sw4
		 */
		public static const INPUT_2SW4:String = 'input_2sw4';
		
		/**
		 * The <code>INPUT_2SW5</code> constant defines the value of the <code>type</code> property 
		 * of a <code>input_2sw5</code> event object.
		 * 	
		 * @eventType input_2sw5
		 */
		public static const INPUT_2SW5:String = 'input_2sw5';
		
		/**
		 * The <code>INPUT_2SW6</code> constant defines the value of the <code>type</code> property 
		 * of a <code>input_2sw6</code> event object.
		 * 	
		 * @eventType input_2sw6
		 */
		public static const INPUT_2SW6:String = 'input_2sw6';
		
		/**
		 * The <code>INPUT_2SW7</code> constant defines the value of the <code>type</code> property 
		 * of a <code>input_2sw7</code> event object.
		 * 	
		 * @eventType input_2sw7
		 */
		public static const INPUT_2SW7:String = 'input_2sw7';
		
		/**
		 * The <code>INPUT_2SW8</code> constant defines the value of the <code>type</code> property 
		 * of a <code>input_2sw8</code> event object.
		 * 	
		 * @eventType input_2sw8
		 */
		public static const INPUT_2SW8:String = 'input_2sw8';
		
		/**
		 * The <code>INPUT_2STRT</code> constant defines the value of the <code>type</code> property 
		 * of a <code>input_2strt</code> event object.
		 * 	
		 * @eventType input_2strt
		 */
		public static const INPUT_2STRT:String = 'input_2strt';
		
		/**
		 * The <code>INPUT_2COIN</code> constant defines the value of the <code>type</code> property 
		 * of a <code>input_2coin</code> event object.
		 * 	
		 * @eventType input_2coin
		 */
		public static const INPUT_2COIN:String = 'input_2coin';
		
		/**
		 * The <code>INPUT_2A</code> constant defines the value of the <code>type</code> property of 
		 * a <code>input_2a</code> event object.
		 * 	
		 * @eventType input_2a
		 */
		public static const INPUT_2A:String = 'input_2a';
		
		/**
		 * The <code>INPUT_2B</code> constant defines the value of the <code>type</code> property of 
		 * a <code>input_2b</code> event object.
		 * 	
		 * @eventType input_2b
		 */
		public static const INPUT_2B:String = 'input_2b';
		
		/** Creates an Ipac2Event object */
		public function Ipac2Event(
			type:String, 
			status:Boolean, 
			input:String = '', 
			bubbles:Boolean = false, 
			cancelable:Boolean = false
		) {
			super(type, status, input, bubbles, cancelable);
		}
		
	}
	
}