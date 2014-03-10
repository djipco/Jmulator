package cc.cote.jmulator.emulators
{
	/**
	 * An enumeration class that defines the trigger modes that can be used with the various
	 * emulator classes.
	 * 
	 * @since version 2.0b
	 */
	public class EmulatorTriggerMode
	{
		
		/** 
		 * A string representing both activation (on) and deactivation (off) states of an emulator.
		 */
		public static const TRIGGER_BOTH:String = "both";
		
		/** 
		 * A string representing only the activation (on) state of the emulator.
		 */
		public static const TRIGGER_ON:String = "on";
		
		/** 
		 * A string representing only the deactivation (off) state of the emulator.
		 */
		public static const TRIGGER_OFF:String = "off";
		
	}
	
}