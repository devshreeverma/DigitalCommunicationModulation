function bits = qpsk_demod(signal)

symbols = pskdemod(signal,4);

bits = de2bi(symbols,2,'left-msb')';
bits = bits(:)';

end