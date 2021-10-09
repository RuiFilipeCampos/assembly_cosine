.data
coef0 QWORD 1.000
coef1 QWORD -0.5
coef2 QWORD 0.04166666666
coef3 QWORD -0.00138888888
coef4 QWORD 0.00002480158
coef5 QWORD 0
coef6 QWORD 0
coef7 QWORD 0
coef QWORD 0 

.code
mul_coef proc
	; prepping xmm3 = x^n
	mulsd xmm2, xmm1  ; x^n *= x^2
	movq xmm3, xmm2   ; tmp = x^n
	mulsd xmm3, xmm4  ; tmp *= xmm4 # where coef is
	addsd xmm0, xmm3  ; xmm0 += tmp
	ret
mul_coef endp


cosine proc 
	; res = xmm0
	; x**2   = xmm1
	; x^n   = xmm2

	movq  xmm1, xmm0   ; xmm1 = x
	mulsd xmm1, xmm1   ; xmm1 = x**2
	movq xmm2, coef0   ; xmm2 = x**2 

	; filling xmm0 with the value of 1 -> the starting point of the taylor series
	
	; xmm0 = 1

	movq xmm0, coef0
	
	movq xmm4, coef1
	call mul_coef
	
	movq xmm4, coef2
	call mul_coef

	movq xmm4, coef3
	call mul_coef

	movq xmm4, coef4
	call mul_coef

	ret
cosine endp
end