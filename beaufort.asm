%include "../include/io.mac"

section .text
    global beaufort
    extern printf
section .data
	aux dd 0

; void beaufort(int len_plain, char *plain, int len_key, char *key, char tabula_recta[26][26], char *enc) ;
beaufort:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]  ; len_plain
    mov ebx, [ebp + 12] ; plain (address of first element in string)
    mov ecx, [ebp + 16] ; len_key
    mov edx, [ebp + 20] ; key (address of first element in matrix)
    mov edi, [ebp + 24] ; tabula_recta
    mov esi, [ebp + 28] ; enc
    ;; DO NOT MODIFY
    ;; TODO: Implement spiral encryption
    ;; FREESTYLE STARTS HERE
	mov edi, 0
	mov dword [aux], 0
loop:
	mov ecx, 0
	mov eax, 0
	mov ecx, [ebp + 8]
	cmp edi, ecx
	jge end
	mov ecx, ecx
	mov cl, byte [ebx+edi]
	mov ebx, 0
	mov ebx, dword [aux]
	mov al, byte [edx+ebx]
	cmp al, cl
	jb invers
	sub al, cl
	add al, 65 
	mov byte [esi+edi], al
	mov esi, [ebp+28]
	mov eax, 0
	mov eax, [ebp+8]
	cmp edi, eax
	je end
        mov ecx, 0
	mov ecx, [ebp + 16]
	dec ecx
	mov ebx, 0
	mov ebx, dword [aux]
	cmp ebx, ecx
	jge zero
	mov ebx, [ebp + 12]
	inc edi
	add dword [aux], 1
	jmp loop
invers:
	sub cl, al
	mov eax, 0
	mov eax, 90
	sub al, cl
	add al, 1
	mov byte [esi+edi], al
	mov eax, 0
	mov eax, [ebp+28]
	cmp edi, eax
	je end
	mov ecx, 0
	mov ecx, [ebp + 16]
	dec ecx
	mov ebx, 0
	mov ebx, [aux]
	cmp ebx, ecx
	jge zero
	inc edi
	add dword [aux] , 1
	mov ebx, [ebp + 12]
	jmp loop
zero:
	mov dword [aux], 0
	mov ecx, 0
	mov ebx, [ebp + 12]
        inc edi
	jmp loop
end:
        mov ecx, [ebp+16]
        mov edx, [ebp+20]
        mov edi, [ebp+24]


    ;; FREESTYLE ENDS HERE
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
