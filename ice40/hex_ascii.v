// Convert ASCII digit to Hex (upper and lowercase supported)
// No error checking on invalid inputs.
function [3:0] f_ASCII_To_Hex;
  input [7:0] i_ASCII;
  begin
    if (i_ASCII == ASCII_a || i_ASCII == ASCII_A) f_ASCII_To_Hex = 4'hA;
    else if (i_ASCII == ASCII_b || i_ASCII == ASCII_B) f_ASCII_To_Hex = 4'hB;
    else if (i_ASCII == ASCII_c || i_ASCII == ASCII_C) f_ASCII_To_Hex = 4'hC;
    else if (i_ASCII == ASCII_d || i_ASCII == ASCII_D) f_ASCII_To_Hex = 4'hD;
    else if (i_ASCII == ASCII_e || i_ASCII == ASCII_E) f_ASCII_To_Hex = 4'hE;
    else if (i_ASCII == ASCII_f || i_ASCII == ASCII_F) f_ASCII_To_Hex = 4'hF;
    else f_ASCII_To_Hex = i_ASCII[3:0];
  end
endfunction


// Convert 4-bit Hex Digit to ASCII digit/letter (lowercase)
function [7:0] f_Hex_To_ASCII;
  input [3:0] i_Hex;
  begin
    if (i_Hex == 4'hA) f_Hex_To_ASCII = ASCII_a;
    else if (i_Hex == 4'hB) f_Hex_To_ASCII = ASCII_b;
    else if (i_Hex == 4'hC) f_Hex_To_ASCII = ASCII_c;
    else if (i_Hex == 4'hD) f_Hex_To_ASCII = ASCII_d;
    else if (i_Hex == 4'hE) f_Hex_To_ASCII = ASCII_e;
    else if (i_Hex == 4'hF) f_Hex_To_ASCII = ASCII_f;
    else f_Hex_To_ASCII = {4'h3, i_Hex[3:0]};
  end
endfunction
