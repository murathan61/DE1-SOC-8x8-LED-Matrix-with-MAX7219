library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
library utils;
use utils.types.all;
use utils.fonts.all;

-- Top-Level entity
entity muro is
    PORT (
		  CLOCK_50 : in std_logic;
		
        GPIO_0 : OUT STD_LOGIC_VECTOR(5 downto 1)
           
    );
END entity;

ARCHITECTURE muro_arch OF muro IS

	COMPONENT LEDMatrix is
	PORT (
		  CLOCK_50 : IN STD_LOGIC;
        LED_DIN,
        LED_CS,
        LED_CLK  : OUT STD_LOGIC
           
		 );
	END COMPONENT;
	
	--SIGNAL sCLOCK_50 : STD_LOGIC;
	--SIGNAL sLED_CLK : STD_LOGIC;
	--SIGNAL sLED_CS : STD_LOGIC;
	--SIGNAL sLED_DIN : STD_LOGIC_VECTOR;
		
	constant clk_period : time := 100 ns;	
BEGIN
	

i1 : LEDMatrix
	PORT MAP (
-- list connections between master ports and signals
		CLOCK_50 => CLOCK_50 ,
		LED_DIN => GPIO_0(1),
		LED_CS => GPIO_0(3),
		LED_CLK =>  GPIO_0(5)
	);
	  
	
END muro_arch;
