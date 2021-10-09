.code
cosine proc 
	; res = xmm0
	; x   = xmm1
	; x^n = xmm2


	; filling xmm0 with the value of 1 -> the starting point of the taylor series
	mov rax, 1
	movq xmm0, rax

	movq xmm1, xmm0
	movq xmm2, xmm0;

	mulsd xmm2, xmm1
	mulsd xmm2, xmm1
	mulsd xmm2, xmm1



	ret
cosine endp
end