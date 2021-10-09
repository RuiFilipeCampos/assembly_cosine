.data
coef0 QWORD 1
coef1 QWORD -0.5
coef2 QWORD 0.04166666666
coef3 QWORD -0.00138888888
coef4 QWORD 0.00002480158
coef5 QWORD 0
coef6 QWORD 0
coef7 QWORD 0

.code
cosine proc 
	; res = xmm0
	; x**2   = xmm1
	; x^n   = xmm2

	movq  xmm1, xmm0   ; xmm1 = x
	mulsd xmm1, xmm1   ; xmm1 = x**2
	movq xmm2, xmm1  ; xmm2 = x**2 (tmp)

	; filling xmm0 with the value of 1 -> the starting point of the taylor series
	
	; xmm0 = 1
	movq xmm0, coef0

	; xmm2 = x**2
	movq xmm3, xmm2   ; so. many. copies. :(
	mulsd xmm3, coef1 ; xmm2 = coef1*x**2 
	addsd xmm0, xmm3  ; xmm0 = 1 + coef1*x**2

	; xmm2 = x**4
	mulsd xmm2, xmm1
	movq xmm3, xmm2
	mulsd xmm3, coef2
	addsd xmm0, xmm3

	; xmm2 = x**4
	mulsd xmm2, xmm1
	movq xmm3, xmm2
	mulsd xmm3, coef3
	addsd xmm0, xmm3

	; xmm2 = x**4
	mulsd xmm2, xmm1
	movq xmm3, xmm2
	mulsd xmm3, coef4
	addsd xmm0, xmm3

	ret
cosine endp
end