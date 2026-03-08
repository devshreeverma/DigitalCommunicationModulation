clc; clear; close all;

% --- Parameters ---
N = 1e5;
snr_db = 0:2:12;

% --- BPSK Simulation ---
bits = randi([0 1], 1, N);
bpsk_signal = bpsk_mod(bits);
ber_bpsk = zeros(size(snr_db));

for i = 1:length(snr_db)
    rx = awgn(bpsk_signal, snr_db(i), 'measured');
    received_bits = bpsk_demod(rx);
    ber_bpsk(i) = calculate_ber(bits, received_bits);
end

% --- QPSK Simulation ---
bits_qpsk = randi([0 1], 1, 2*N);
qpsk_signal = qpsk_mod(bits_qpsk);
ber_qpsk = zeros(size(snr_db));

for i = 1:length(snr_db)
    rx = awgn(qpsk_signal, snr_db(i), 'measured');
    received_bits = qpsk_demod(rx);
    ber_qpsk(i) = calculate_ber(bits_qpsk, received_bits);
end

% --- Performance Analysis ---
figure(1);
semilogy(snr_db, ber_bpsk, '-o', 'LineWidth', 2); hold on;
semilogy(snr_db, ber_qpsk, '-s', 'LineWidth', 2);
grid on;
xlabel('SNR (dB)'); ylabel('Bit Error Rate');
title('BER vs SNR Performance');
legend('BPSK', 'QPSK');

% --- QPSK Constellation ---
figure(2);
noisy_qpsk = awgn(qpsk_signal, 12, 'measured');
scatter(real(noisy_qpsk(1:3000)), imag(noisy_qpsk(1:3000)), 15, 'b', 'filled');
hold on;
ideal_qpsk = [1+1j, -1+1j, -1-1j, 1-1j];
scatter(real(ideal_qpsk), imag(ideal_qpsk), 100, 'r', 'x', 'LineWidth', 2);
grid on; axis square; axis([-2 2 -2 2]);
xlabel('In-Phase (I)'); ylabel('Quadrature (Q)');
title('QPSK Constellation');
legend('Received', 'Ideal');

% --- BPSK Constellation ---
figure(3);
noisy_bpsk = awgn(bpsk_signal, 12, 'measured'); 
scatter(real(noisy_bpsk(1:2000)), imag(noisy_bpsk(1:2000)), 30, 'b', 'filled');
hold on;
scatter([-1 1], [0 0], 100, 'r', 'x', 'LineWidth', 2);
grid on; axis square; axis([-2 2 -1 1]);
xlabel('In-Phase (I)'); ylabel('Quadrature (Q)');
title('BPSK Constellation');
legend('Received', 'Ideal');