%include "../include/io.mac"

struc point
    .x: resw 1
    .y: resw 1
endstruc

section .text
    global points_distance
    extern printf

section .data
	aux dd 0
	aux1 dw 0

points_distance:
    ;; DO NOT MODIFY
 
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; points
    mov eax, [ebp + 12]     ; distance
    ;; DO NOT MODIFY

    ;; Your code starts here

	mov edx, 0
	mov ecx, 0
	mov esi, 0
	mov eax, 0
	mov edi, 0
	mov edi, ebx
	mov ebx, 0
label:
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
	sub bx, dx
	mov cx, bx
	jmp end
y_egal:
	sub ax, cx
	mov cx, ax
end:
	mov ebx, [ebp + 8]
	mov eax, [ebp + 12]
	mov [eax], cx
    ;; Your code ends here
 
    ;; DO NOT MODIFY
    popa
    leave
    ret

    ;; DO NOT MODIFY
