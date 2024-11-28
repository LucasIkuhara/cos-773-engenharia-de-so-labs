[BITS 16]            ; Usa o "16-bit real mode"
[ORG 0x7C00]         ; Carrega o bootloader no endereço 0x7C00

start:
    mov si, message  ; Carrega o endereço da mensagem

print_char:
    lodsb            ; Carrega o próximo caracter
    cmp al, 0        ; Checa se é um 'terminador nulo'
    je done          ; Se for, pula para o bloco que encerra a execução
    mov ah, 0x0E     ; Escolhe função imprimir "teletype output"
    int 0x10         ; Imprime na tela
    jmp print_char   ; Reinicia o bloco para o próximo caracter

; O trecho abaixo é um loop para impedir que o programa feche imediatamente
done:
    cli              ;
hang:
    hlt              ; Para a CPU
    jmp hang         ;

message db 'Ola do bootloader', 0 ;

times 510-($-$$) db 0          ; Preenche o final do espaço com zeros
dw 0xAA55                      ; Bootloader signature
