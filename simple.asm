%include "../include/io.mac"

section .text
    global simple
    extern printf
section .data
	aux db 0

simple:
    ;; DO NOT MODIFY
    push    ebp
    mov     ebp, esp
    pusha

    mov     ecx, [ebp + 8]  ; len
    mov     esi, [ebp + 12] ; plain
    mov     edi, [ebp + 16] ; enc_string
    mov     edx, [ebp + 20] ; step

    ;; DO NOT MODIFY
    ;; Your code starts here

	mov ebx, 0
	mov eax, 0
    label:
        mov al, byte [esi + ebx] ;;ia primul element din plain
	add al, dl ;;adauga pasul
	cmp al, 90 ;; compara sa vada daca este 90
	jg final ;; daca e mai mare trebuie sa ia de la capat alfabetul
        mov [edi + ebx], al ;;pune inapoi in enc_string ce litera am gasit
        inc ebx ;;incrementeaza indicele
        jmp verify_end
    verify_end:
        cmp ebx, ecx ;;verifica daca indicele este egal cu len
        jge end ;;ca sa stie ca s-a terminat codul
        jmp label ;;daca nu, reia
	final:
	mov al,0 ;;calculeaza litera stiind ca trebuie sa ia alfabetul 
	mov al, byte [esi + ebx] ;;de la capat
	add al, dl
	sub al, 26
	mov [edi + ebx], al
	inc ebx
	jmp verify_end
    end:
	;; final

    ;; Your code ends here

    ;; DO NOT MODIFY

    popa
    leave
    ret

    ;; DO NOT MODIFY
