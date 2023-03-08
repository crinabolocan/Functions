%include "../include/io.mac"

section .text
    global is_square
    extern printf

is_square:
    ;; DO NOT MODIFY
    push ebp
    mov ebp, esp
    pusha

    mov ebx, [ebp + 8]      ; dist
    mov eax, [ebp + 12]     ; nr
    mov ecx, [ebp + 16]     ; sq
    ;; DO NOT MODIFY
 
    ;; Your code starts here

	mov eax, 0
	mov eax, ebx
	mov edi, 0
	mov eax,dword [eax + edi]
	;;PRINTF32 `primadist= %d\n\x0`, eax
	mov esi, 0 ;;reg1
	mov edx ,0 ;;reg2
	mov esi, 2
	label:
	;;mov edx, esi
	;;imul edx, edx
	;;cmp edx, eax
	;;je perfectp
	;;mov ecx, 0
	;;jmp verificare_dep
	;;jmp verify_end
	cmp eax, 0
	je egal
	cmp eax, 1
	je egal
verificare_dep:
	mov edx, 0
	mov edx, esi
	imul edx, edx
        ;;PRINTF32 `mul=%d\n\x0`, edx
	cmp edx, eax
	jg mov0
	jmp verificare_perf
mov0:
	mov dword [ecx+4*edi], 0
	mov esi, 0
	jmp verify_end
verificare_perf:
	cmp eax, edx
	je egal
	inc esi
	cmp eax, edx
	jg verificare_dep
egal:
	mov dword [ecx+4*edi], 1
	mov esi, 0
	jmp verify_end
	again:
	mov eax, 0
	mov eax, [ebp+8]
	inc edi
	mov eax, dword [eax + 4*edi]
	jmp label
verify_end:
	mov eax, 0
	mov eax, [ebp+12]
	sub eax, 1
	cmp edi, eax
	je end
	jmp again
end:

    ;; Your code ends here
 
    ;; DO NOT MODIFY
    popa
    leave
    ret
    ;; DO NOT MODIFY
