function ber = calculate_ber(tx_bits,rx_bits)

ber = sum(tx_bits ~= rx_bits)/length(tx_bits);

end