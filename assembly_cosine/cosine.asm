

.code
cosine proc 
	; res = xmm0
	; x**2   = xmm1
	; x^n   = xmm2

	movq  xmm1, xmm0   ; xmm1 = x
	mulsd xmm1, xmm1   ; xmm1 = x**2

	movq xmm2, xmm0  ; xmm2 = x**2 (tmp)

	; filling xmm0 with the value of 1 -> the starting point of the taylor series
	mov rax, 1
	movq xmm0, rax

	; x**2
	; coef = - 1/2

	mov rax, -1/2
	movq xmm3, rax
	mulsd xmm3, xmm2
	addsd xmm0, xmm3


	mulsd xmm2, xmm1 ; x**4
	mov rax, -1/2
	movq xmm3, rax
	mulsd xmm3, xmm2
	addsd xmm0, xmm3



	mulsd xmm2, xmm1 ; x**6
	addsd xmm0, xmm2

	mulsd xmm2, xmm1 ; x**8
	addsd xmm0, xmm2

	mulsd xmm2, xmm1 ; x**10
	addsd xmm0, xmm2

	mulsd xmm2, xmm1 ; x**12
	addsd xmm0, xmm2

	ret
cosine endp
end