.data
CONSTANTS QWORD 0, 1, 2, 3, 4, 5


.code
cosine proc 
	; res = xmm0
	; x   = xmm1
	; x^n = xmm2

	movq xmm1, xmm0 ; defining x
	movq xmm2, xmm0

	; filling xmm0 with the value of 1 -> the starting point of the taylor series
	mov rax, 1
	movq xmm0, rax

	; x

	mulsd xmm2, xmm1 ; x**2

	mulsd xmm2, xmm1 ; x**3

	mulsd xmm2, xmm1 ; x**4

	mulsd xmm2, xmm1 ; x**5

	mulsd xmm2, xmm1 ; x**6


	movq xmm0, xmm2
	ret
cosine endp
end