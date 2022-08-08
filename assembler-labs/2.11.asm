; Вычислите произведение регистров X и Y.
	
	org $8000

	stx $0001	;	сохранение Х в ячейки 0001-0002
	sty $0003	;	сохранение Y в ячейки 0003-0004

	xgdx		;	меняем местами X и D
	tba		;	заносим в А значение B (вторая половина X)
	psha		;	запоминаем в стек A
	xgdy		;	меняем местами X и Y
	pula		;	восстанавливаем из стека A

	mul		;	умножаем 2 половину X на 2 половину Y
	std $000b	;	сохраняем результат в ячейки 000b-000c

	ldaa $0001	;	A = 1 половина X
	ldab $0004	;	B = 2 половина Y
	mul		;	перемножаем
	std $0009	;	результат заносим в ячейки 0009-000a

	ldaa $0002	;	A = 2 половина X
	ldab $0003	;	B = 1 половина Y
	mul		;	перемножаем
	std $0007	;	результат заносим в ячейки 0007-0008

	ldaa $0001	;	A = 1 половина X
	ldab $0003	;	B = 1 половина Y
	mul		;	перемножаем
	std $0005	;	результат заносим в ячейки 0005-0006

	ldaa $0008	;	грузим младшие 4 байта числа
	ldab $000c	;	
	adda $000a	;	и складываем с произведениями
	adda $000b	;
	std $0012	;	сохраняем 2 половину результата в ячейки 0012-0013

	ldaa $0005	;	грузим старшие 4 байта числа
	ldab $0006	;
	adcb $0007	;	и складываем с произведениями (с учетом переноса)
	adcb $0009	;
	std $0010	;	сохраняем 1 половину результата в ячейки 0010-0011

	ldx $0010	;	вывод 1 половины результата в X
	ldy $0012	;	вывод 2 половины результата в Y
hlt