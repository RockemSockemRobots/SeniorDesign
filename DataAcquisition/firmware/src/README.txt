files within the system_config directory are msd_basic files
NOTE:SOME HAVE BEEN MODIFIED
	
	system_init.c		handles initialization for the pic32 curiosity board (modified)
							interrupt priorities must be set here (with current functionality)

	system_interrupt.c 	houses all interrupt service routines (modified)
							all enabled interrupts need an ISR defined here otherwise the board will reset
							
	system_exceptions.c houses functions to handle exceptions (modified)
							if all is well the modifications shouldn't matter
							exception handlers were added to help debug adc integration issues

	the others are important for functionality but unmodified