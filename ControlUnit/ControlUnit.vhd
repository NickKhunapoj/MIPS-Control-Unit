LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY ControlUnit IS
    PORT (
        Instruction : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
        RegDst : OUT STD_LOGIC;
        Jump : OUT STD_LOGIC;
        Branch : OUT STD_LOGIC;
        MemtoReg : OUT STD_LOGIC;
        MemRead : OUT STD_LOGIC;
        ALUOp : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
        MemWrite : OUT STD_LOGIC;
        ALUSrc : OUT STD_LOGIC;
        RegWrite : OUT STD_LOGIC
    );
END ENTITY ControlUnit;

ARCHITECTURE Behavioral OF ControlUnit IS
BEGIN

    -- RegDst output
    RegDst <= NOT Instruction(1);
    -- Branch output
    Branch <= Instruction(2);
    -- ALUSrc output
    ALUSrc <= Instruction(0);
    -- MemtoReg output
    MemToReg <= Instruction(0);
    -- RegWrite output
    RegWrite <= ((NOT Instruction(2)) AND (NOT Instruction(1))) OR ((NOT Instruction(3)) AND instruction(0));
    -- MemRead output
    MemRead <= (NOT Instruction(3)) AND Instruction(0);
    -- MemWrite output
    MemWrite <= Instruction(3);
    -- Jump output
    Jump <= NOT Instruction(5) AND Instruction(1);
    -- ALUOp output
    ALUOp(1) <= (NOT Instruction(2)) AND (NOT Instruction(1));
    ALUOp(0) <= Instruction(2);

END ARCHITECTURE Behavioral;










