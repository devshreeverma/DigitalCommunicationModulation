function signal = qpsk_mod(bits)

symbols = bi2de(reshape(bits,2,[])','left-msb');

signal = pskmod(symbols,4);

end