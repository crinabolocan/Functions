%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global road
    extern printf

road:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov eax, [ebp + 8]      ; points
    mov ecx, [ebp + 12]     ; len
    mov ebx, [ebp + 16]     ; distances
    ;; DO NOT MODIFY
   
    ;; Your code starts here
loop:
	mov edx, 0
	mov ecx, 0
	mov esi, 0
	mov edi, 0
	mov edi, eax
	mov ebx, 0
	mov eax, 0
label:
	mov edx, 0
	mov ecx, 0
	mov eax, 0
	mov ebx, 0
	mov cx, [edi + point_size*esi + point.x]
	mov dx, [edi + point_size*esi + point.y]
	inc esi
	mov ax, [edi + point_size*esi + point.x]
	mov bx, [edi + point_size*esi + point.y]
	cmp ax, cx
	je x_egal
	cmp bx, dx
	je y_egal

x_egal:
	cmp bx, dx
	jb invers1
	sub bx, dx
	mov dx, bx
	jmp end
	invers1:
	sub dx, bx
	jmp end
y_egal:
	cmp ax, cx
	jb invers2
	sub ax, cx
	mov dx, ax
	jmp end
	invers2:
	sub cx, ax
	mov dx, cx
end:
	mov eax, [ebp+8]
	mov ecx, [ebp+12]
	mov ebx, [ebp+16]
	dec esi
	mov dword [ebx+4*esi], edx
	inc esi
	sub ecx, 1
	cmp esi, ecx
	jb label

    ;; Your code ends here
    
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
