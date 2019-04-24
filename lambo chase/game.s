	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"game.c"
	.text
	.align	2
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullets.part.2, %function
updateBullets.part.2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #4]
	ldr	r1, [r0, #20]
	ldr	r2, [r0, #12]
	add	r3, r3, r1
	add	r2, r2, #240
	cmp	r3, r2
	str	r3, [r0, #4]
	bgt	.L2
	str	lr, [sp, #-4]!
	mov	lr, #6
	ldr	r2, [r0, #24]
	ldr	ip, .L9
	add	r2, r2, #50
	ldrb	r0, [r0]	@ zero_extendqisi2
	lsl	r2, r2, #3
	lsl	r3, r3, #23
	add	r1, ip, r2
	lsr	r3, r3, #23
	strh	r0, [ip, r2]	@ movhi
	strh	lr, [r1, #4]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L2:
	mov	r3, #0
	str	r3, [r0, #16]
	bx	lr
.L10:
	.align	2
.L9:
	.word	shadowOAM
	.size	updateBullets.part.2, .-updateBullets.part.2
	.align	2
	.global	updateScore
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateScore, %function
updateScore:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L13
	push	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r3, [r3]
	ldr	r1, .L13+4
	ldr	r0, .L13+8
	ldr	r10, .L13+12
	smull	r2, lr, r3, r0
	smull	r2, r8, r3, r1
	smull	r2, r10, r3, r10
	ldr	r2, .L13+16
	smull	r1, ip, r2, r3
	asr	r2, r3, #31
	rsb	r0, r2, lr, asr #5
	rsb	r10, r2, r10, asr #2
	rsb	r1, r2, r8, asr #6
	rsb	r2, r2, ip, asr #12
	ldr	ip, .L13+12
	smull	lr, ip, r10, ip
	ldr	r9, .L13+12
	smull	lr, r9, r0, r9
	ldr	r8, .L13+12
	mov	r7, #72
	mov	r6, #64
	smull	lr, r8, r1, r8
	mov	r5, #56
	ldr	lr, .L13+12
	smull	fp, lr, r2, lr
	asr	fp, r10, #31
	rsb	fp, fp, ip, asr #2
	add	fp, fp, fp, lsl #2
	add	ip, r10, r10, lsl #2
	sub	ip, r3, ip, lsl #1
	sub	r10, r10, fp, lsl #1
	ldr	r3, .L13+20
	add	r10, r10, #432
	add	fp, r3, #820
	add	r10, r10, #1
	add	ip, ip, #432
	strh	r10, [fp]	@ movhi
	add	ip, ip, #1
	add	r10, r3, #812
	strh	ip, [r10]	@ movhi
	asr	ip, r0, #31
	rsb	r9, ip, r9, asr #2
	add	r9, r9, r9, lsl #2
	sub	r0, r0, r9, lsl #1
	add	r0, r0, #432
	add	r0, r0, #1
	add	ip, r3, #828
	strh	r0, [ip]	@ movhi
	asr	r0, r1, #31
	rsb	r8, r0, r8, asr #2
	asr	r0, r2, #31
	add	r8, r8, r8, lsl #2
	rsb	lr, r0, lr, asr #2
	sub	r1, r1, r8, lsl #1
	add	lr, lr, lr, lsl #2
	sub	r2, r2, lr, lsl #1
	add	r1, r1, #432
	add	r0, r3, #836
	add	r1, r1, #1
	add	r2, r2, #432
	strh	r1, [r0]	@ movhi
	add	r2, r2, #1
	add	r1, r3, #844
	strh	r2, [r1]	@ movhi
	ldr	r1, .L13+24
	add	r2, r3, #800
	strh	r1, [r2]	@ movhi
	ldr	r1, .L13+28
	strh	r1, [r2, #2]	@ movhi
	ldr	r1, .L13+32
	add	r2, r3, #804
	strh	r1, [r2]	@ movhi
	ldr	r2, .L13+36
	add	r0, r3, #808
	add	r1, r3, #816
	strh	r7, [r0, #2]	@ movhi
	strh	r2, [r0]	@ movhi
	strh	r2, [r1]	@ movhi
	strh	r6, [r1, #2]	@ movhi
	add	r0, r3, #824
	add	r1, r3, #832
	add	r3, r3, #840
	strh	r2, [r0]	@ movhi
	strh	r5, [r0, #2]	@ movhi
	mov	r4, #48
	strh	r2, [r1]	@ movhi
	strh	r2, [r3]	@ movhi
	mov	r2, #40	@ movhi
	strh	r4, [r1, #2]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	pop	{r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	cycleTime
	.word	274877907
	.word	1374389535
	.word	1717986919
	.word	1759218605
	.word	shadowOAM
	.word	20624
	.word	16388
	.word	401
	.word	4240
	.size	updateScore, .-updateScore
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #56
	push	{r4, r5, r6, lr}
	mov	r3, #0
	mov	r0, #32
	mov	r6, #72
	mov	lr, #16
	mov	r4, #108
	mov	ip, #2
	mov	r5, #1
	ldr	r2, .L17
	str	r1, [r2, #16]
	ldr	r1, .L17+4
	stm	r2, {r0, r6}
	str	r0, [r1]
	str	r4, [r1, #4]
	str	lr, [r2, #20]
	str	ip, [r2, #28]
	ldr	lr, .L17+8
	ldr	ip, .L17+12
	ldr	r0, .L17+16
	str	r3, [r1, #20]
	str	r3, [r1, #24]
	ldr	r1, .L17+20
	str	r5, [r2, #12]
	str	r3, [lr]
	str	r3, [r2, #8]
	str	r3, [r2, #32]
	str	r3, [r2, #36]
	str	r3, [r2, #40]
	str	r3, [r2, #24]
	str	r3, [ip]
	str	r3, [r0]
	str	r3, [r1]
	pop	{r4, r5, r6, lr}
	bx	lr
.L18:
	.align	2
.L17:
	.word	player
	.word	uzi
	.word	bulletsFired
	.word	alreadyExecuted1
	.word	alreadyExecuted2
	.word	alreadyExecuted3
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initInstructionsPolice
	.syntax unified
	.arm
	.fpu softvfp
	.type	initInstructionsPolice, %function
initInstructionsPolice:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #56
	push	{r4, r5, lr}
	mov	ip, #3
	mov	r5, #16
	mov	r4, #1
	mov	lr, #0
	ldr	r2, .L21
	str	r3, [r0, #12]
	ldm	r2, {r2, r3}
	sub	r3, r3, #72
	str	r5, [r0, #16]
	stm	r0, {r2, r3, r4}
	str	lr, [r0, #24]
	str	r1, [r0, #20]
	str	ip, [r0, #28]
	pop	{r4, r5, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	player
	.size	initInstructionsPolice, .-initInstructionsPolice
	.align	2
	.global	initPolice
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPolice, %function
initPolice:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	ip, #0
	mov	r6, #56
	mov	r5, #16
	mov	r4, #88
	mov	lr, #1
	mov	r2, #3
	ldr	r3, .L25
	ldr	r3, [r3, #4]
	sub	r3, r3, #96
	str	r6, [r0, #12]
	str	r5, [r0, #16]
	str	r4, [r0]
	stmib	r0, {r3, lr}
	str	r1, [r0, #20]
	str	ip, [r0, #24]
	str	r2, [r0, #28]
	pop	{r4, r5, r6, lr}
	bx	lr
.L26:
	.align	2
.L25:
	.word	player
	.size	initPolice, .-initPolice
	.align	2
	.global	initObstacle
	.syntax unified
	.arm
	.fpu softvfp
	.type	initObstacle, %function
initObstacle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #0
	mov	ip, #1
	push	{r4, r5, r6, lr}
	stm	r0, {r1, r2, r3, ip}
	str	r3, [r0, #36]
	cmp	r2, #3
	ldrls	pc, [pc, r2, asl #2]
	b	.L27
.L30:
	.word	.L33
	.word	.L32
	.word	.L31
	.word	.L29
.L29:
	mov	lr, #8
	mov	ip, #24
	mvn	r1, #1
	mov	r2, #80
.L37:
	mov	r3, #240
	str	lr, [r0, #32]
	str	ip, [r0, #28]
	str	r1, [r0, #24]
	str	r2, [r0, #16]
	str	r3, [r0, #20]
.L27:
	pop	{r4, r5, r6, lr}
	bx	lr
.L31:
	mov	lr, #8
	mov	ip, #16
	mvn	r1, #1
	mov	r2, #88
	b	.L37
.L32:
	mov	r3, #8
	mvn	r2, #2
	str	r3, [r0, #32]
	str	r3, [r0, #28]
	str	r2, [r0, #24]
	ldr	r3, .L38
	mov	r4, r0
	mov	lr, pc
	bx	r3
	tst	r0, #1
	moveq	r0, #78
	movne	r0, #64
	mov	r1, #240
	mov	r2, #0
	mov	r3, #2
	str	r0, [r4, #16]
	str	r1, [r4, #20]
	str	r2, [r4, #52]
	str	r3, [r4, #56]
	pop	{r4, r5, r6, lr}
	bx	lr
.L33:
	mov	r5, #16
	mov	r4, #8
	mvn	lr, #1
	mov	ip, #96
	mov	r1, #240
	mov	r2, #0
	mov	r3, #4
	str	r5, [r0, #32]
	str	r4, [r0, #28]
	str	lr, [r0, #24]
	str	ip, [r0, #16]
	str	r1, [r0, #20]
	str	r2, [r0, #52]
	str	r3, [r0, #56]
	pop	{r4, r5, r6, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	rand
	.size	initObstacle, .-initObstacle
	.align	2
	.global	initInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	initInstructions, %function
initInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	fp, #88
	ldr	r4, .L48
	str	r2, [r4]
	ldr	r4, .L48+4
	str	r2, [r4]
	ldr	r4, .L48+8
	str	r2, [r4]
	ldr	r4, .L48+12
	str	r2, [r4]
	ldr	r4, .L48+16
	str	fp, [r4, #4]
	mov	fp, #2
	mov	r8, #128
	mov	r7, #1
	mov	r10, #16
	mov	r9, #56
	str	fp, [r4, #28]
	ldr	fp, .L48+20
	mov	r3, r2
	mov	r6, r2
	str	r2, [r4, #8]
	str	r2, [r4, #32]
	str	r2, [r4, #36]
	str	r2, [r4, #40]
	str	r2, [r4, #24]
	str	r2, [fp, #20]
	str	r2, [fp, #24]
	mov	r2, #124
	mov	r5, r8
	mov	lr, r7
	mov	r1, r10
	mov	ip, r9
	mov	r0, #3
	str	r2, [fp, #4]
	ldr	r2, .L48+24
	str	r8, [r4]
	str	r7, [r2]
	str	r8, [fp]
	str	r7, [r4, #12]
	str	r10, [r4, #20]
	str	r9, [r4, #16]
	ldr	r2, .L48+28
.L41:
	add	r3, r3, #1
	cmp	r3, #3
	str	r3, [r2, #20]
	str	ip, [r2, #12]
	str	r1, [r2, #16]
	str	r5, [r2]
	stmib	r2, {r1, lr}
	str	r6, [r2, #24]
	str	r0, [r2, #28]
	add	r2, r2, #32
	bne	.L41
	mov	r2, #0
	ldr	r5, .L48+32
.L42:
	add	r6, r2, #1
	mov	r0, r5
	and	r2, r2, #3
	mov	r1, r6
	bl	initObstacle
	cmp	r6, #10
	mov	r2, r6
	add	r5, r5, #60
	bne	.L42
	mov	r2, #0
	mov	r1, #8
	mov	r0, r2
	ldr	ip, [r4, #4]
	ldr	r5, [r4, #16]
	ldr	lr, [r4]
	ldr	r3, .L48+36
	add	ip, ip, r5
.L43:
	add	r2, r2, #1
	cmp	r2, #20
	str	r2, [r3, #24]
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r1, [r3, #20]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r0, [r3, #16]
	add	r3, r3, #28
	bne	.L43
	ldr	r3, .L48+40
	ldr	ip, .L48+44
	ldr	r1, .L48+48
	ldr	r2, .L48+52
	str	r0, [r3]
	str	r0, [ip]
	str	r0, [r1]
	str	r0, [r2]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L49:
	.align	2
.L48:
	.word	bulletsFired
	.word	alreadyExecuted1
	.word	alreadyExecuted2
	.word	alreadyExecuted3
	.word	player
	.word	uzi
	.word	instructions
	.word	police
	.word	obs
	.word	bullets
	.word	ghostMode
	.word	time
	.word	cycleTime
	.word	hasLost
	.size	initInstructions, .-initInstructions
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r0, #9984
	mov	r4, #0
	mov	r2, #12288
	ldr	lr, .L58
	ldr	ip, .L58+4
	ldr	r1, .L58+8
	ldr	r3, .L58+12
	ldr	r5, .L58+16
	str	r4, [lr]
	str	r4, [r5]
	str	r4, [ip]
	str	r0, [r1]
	str	r2, [r3]
	mov	r5, r4
	bl	initPlayer
	mov	r7, #56
	mov	r2, r4
	mov	lr, #88
	mov	r4, #16
	mov	ip, #1
	mov	r0, #3
	ldr	r6, .L58+20
	ldr	r1, [r6, #4]
	ldr	r3, .L58+24
	sub	r1, r1, #96
.L51:
	add	r2, r2, #1
	cmp	r2, #3
	str	r2, [r3, #20]
	str	r7, [r3, #12]
	str	r4, [r3, #16]
	str	lr, [r3]
	stmib	r3, {r1, ip}
	str	r5, [r3, #24]
	str	r0, [r3, #28]
	add	r3, r3, #32
	bne	.L51
	mov	r2, #0
	ldr	r4, .L58+28
.L52:
	add	r5, r2, #1
	mov	r0, r4
	and	r2, r2, #3
	mov	r1, r5
	bl	initObstacle
	cmp	r5, #10
	mov	r2, r5
	add	r4, r4, #60
	bne	.L52
	mov	r2, #0
	mov	r1, #8
	mov	r0, r2
	ldr	ip, [r6, #4]
	ldr	r4, [r6, #16]
	ldr	lr, [r6]
	ldr	r3, .L58+32
	add	ip, ip, r4
.L53:
	add	r2, r2, #1
	cmp	r2, #20
	str	r2, [r3, #24]
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r1, [r3, #20]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r0, [r3, #16]
	add	r3, r3, #28
	bne	.L53
	mov	r1, #57344
	mov	r6, #1
	mov	r5, #67108864
	mvn	r4, #119
	mov	lr, #195
	mov	ip, #132
	ldr	r3, .L58+36
	str	r0, [r3]
	ldr	r3, .L58+40
	str	r0, [r3]
	ldr	r3, .L58+44
	str	r0, [r3]
	ldr	r3, .L58+48
	ldr	r2, .L58+52
	str	r0, [r3]
	ldr	r3, .L58+56
	strh	r0, [r3, #10]	@ movhi
	strh	r6, [r2, #8]	@ movhi
	strh	r0, [r3, #14]	@ movhi
	strh	r0, [r5, #76]	@ movhi
	strh	r1, [r3, #8]	@ movhi
	ldrh	r1, [r2]
	orr	r1, r1, #32
	strh	r4, [r3, #12]	@ movhi
	strh	r1, [r2]	@ movhi
	ldr	r2, .L58+60
	strh	lr, [r3, #10]	@ movhi
	strh	ip, [r3, #14]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	str	r0, [r2]
	bx	lr
.L59:
	.align	2
.L58:
	.word	hOffBG0
	.word	hOffBG3
	.word	vOffBG0
	.word	vOffBG3
	.word	instructions
	.word	player
	.word	police
	.word	obs
	.word	bullets
	.word	time
	.word	cycleTime
	.word	hasLost
	.word	ghostMode
	.word	67109376
	.word	67109120
	.word	mosaic
	.size	initGame, .-initGame
	.align	2
	.global	initBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r2, #0
	push	{r4, lr}
	mov	r1, #8
	mov	lr, r2
	ldr	r3, .L64
	ldr	r0, [r3, #4]
	ldr	r4, [r3, #16]
	ldr	ip, [r3]
	ldr	r3, .L64+4
	add	r0, r0, r4
.L61:
	add	r2, r2, #1
	cmp	r2, #20
	str	r2, [r3, #24]
	str	ip, [r3]
	str	r0, [r3, #4]
	str	r1, [r3, #20]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	lr, [r3, #16]
	add	r3, r3, #28
	bne	.L61
	pop	{r4, lr}
	bx	lr
.L65:
	.align	2
.L64:
	.word	player
	.word	bullets
	.size	initBullets, .-initBullets
	.align	2
	.global	spawnObstacle
	.syntax unified
	.arm
	.fpu softvfp
	.type	spawnObstacle, %function
spawnObstacle:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldm	r0, {r1, r2}
	mov	r4, r0
	bl	initObstacle
	mov	r3, #1
	str	r3, [r4, #36]
	pop	{r4, lr}
	bx	lr
	.size	spawnObstacle, .-spawnObstacle
	.global	__aeabi_idivmod
	.align	2
	.global	updateObstacles
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateObstacles, %function
updateObstacles:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, [r0, #32]
	ldr	r2, [r0, #20]
	rsb	r3, r3, #0
	cmp	r2, r3
	movle	r3, #0
	strle	r3, [r0, #36]
	ble	.L70
	ldr	r3, [r0, #36]
	cmp	r3, #0
	beq	.L70
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L99
	sub	sp, sp, #16
	mov	r5, r0
	mov	r8, #0
	ldr	r7, .L99+4
	add	r6, r4, #560
	b	.L73
.L71:
	add	r4, r4, #28
	cmp	r6, r4
	beq	.L96
.L73:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L71
	ldr	r0, [r5, #32]
	ldr	r1, [r5, #28]
	ldr	r3, [r5, #16]
	str	r2, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	ldm	r4, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L72
	add	r4, r4, #28
	cmp	r6, r4
	ldr	r2, [r5, #20]
	bne	.L73
.L96:
	ldr	r4, .L99+8
	ldr	r3, [r4, #32]
	cmp	r3, #0
	beq	.L97
.L74:
	ldr	r1, .L99+12
	ldr	r3, .L99+16
	ldr	r1, [r1]
	smull	ip, r0, r3, r1
	asr	r3, r1, #31
	rsb	r3, r3, r0, asr #3
	ldr	r4, [r5, #24]
	add	r3, r3, r3, lsl #2
	add	r4, r2, r4
	cmp	r1, r3, lsl #2
	str	r4, [r5, #20]
	bne	.L77
	ldr	r0, [r5, #52]
	ldr	r3, .L99+20
	add	r0, r0, #1
	ldr	r1, [r5, #56]
	mov	lr, pc
	bx	r3
	str	r1, [r5, #52]
.L77:
	ldr	r3, [r5, #4]
	cmp	r3, #3
	ldrls	pc, [pc, r3, asl #2]
	b	.L68
.L80:
	.word	.L83
	.word	.L82
	.word	.L81
	.word	.L79
.L72:
	str	r8, [r4, #16]
	ldr	r3, [r5, #8]
	add	r3, r3, #1
	cmp	r3, #2
	str	r3, [r5, #8]
	ldr	r2, [r5, #20]
	strgt	r8, [r5, #36]
	b	.L71
.L70:
	mov	r1, #512
	ldr	r3, [r0]
	ldr	r2, .L99+24
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L79:
	ldrb	r1, [r5, #16]	@ zero_extendqisi2
	mvn	r1, r1, lsl #17
	mvn	r1, r1, lsr #17
	ldr	r3, [r5, #8]
	ldr	r0, [r5]
	lsl	r2, r4, #23
	lsl	r3, r3, #7
	lsr	r2, r2, #23
	ldr	lr, .L99+24
	lsl	r0, r0, #3
	add	r3, r3, #26
	orr	r2, r2, #16384
.L95:
	add	ip, lr, r0
	orr	r3, r3, #1024
	strh	r1, [lr, r0]	@ movhi
	strh	r2, [ip, #2]	@ movhi
	strh	r3, [ip, #4]	@ movhi
.L68:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L81:
	ldrb	r1, [r5, #16]	@ zero_extendqisi2
	mvn	r1, r1, lsl #17
	ldr	r3, [r5, #8]
	ldr	r0, [r5]
	lsl	r3, r3, #7
	lsl	r2, r4, #23
	mvn	r1, r1, lsr #17
	ldr	lr, .L99+24
	lsl	r0, r0, #3
	add	r3, r3, #25
	lsr	r2, r2, #23
	b	.L95
.L82:
	ldr	r3, [r5, #52]
	ldr	r1, [r5]
	ldr	ip, .L99+24
	lsl	r3, r3, #5
	ldrb	lr, [r5, #16]	@ zero_extendqisi2
	lsl	r1, r1, #3
	lsl	r2, r4, #23
	add	r3, r3, #7
	add	r0, ip, r1
	lsr	r2, r2, #23
	orr	r3, r3, #1024
	strh	lr, [ip, r1]	@ movhi
	strh	r2, [r0, #2]	@ movhi
	strh	r3, [r0, #4]	@ movhi
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L83:
	ldr	r3, [r5, #52]
	ldr	r1, [r5]
	ldrb	r0, [r5, #16]	@ zero_extendqisi2
	ldr	lr, .L99+24
	lsl	r3, r3, #5
	lsl	r1, r1, #3
	lsl	r2, r4, #23
	add	r3, r3, #9
	add	ip, lr, r1
	lsr	r2, r2, #23
	orr	r0, r0, #16384
	orr	r3, r3, #7168
	strh	r0, [lr, r1]	@ movhi
	strh	r2, [ip, #2]	@ movhi
	strh	r3, [ip, #4]	@ movhi
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L97:
	ldr	r0, [r5, #32]
	ldr	r1, [r5, #28]
	ldr	r3, [r5, #16]
	str	r2, [sp, #4]
	str	r0, [sp, #12]
	str	r1, [sp, #8]
	str	r3, [sp]
	ldr	r6, .L99+4
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #20]
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r6
	cmp	r0, #0
	beq	.L76
	ldr	r3, .L99+28
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L98
.L76:
	ldr	r2, [r5, #20]
	b	.L74
.L98:
	ldr	ip, [r4, #4]
	ldr	r2, .L99+32
	sub	ip, ip, #16
	ldr	r1, .L99+36
	ldr	r0, .L99+40
	ldr	r6, .L99+44
	str	ip, [r4, #4]
	mov	lr, pc
	bx	r6
	mov	r2, #1
	mov	r0, #3
	mov	r3, #67108864
	mov	r1, #13056
	ldr	lr, .L99+48
	str	r2, [r4, #32]
	ldr	lr, [lr]
	ldr	r2, .L99+52
	ldr	ip, .L99+56
	str	r0, [r2]
	str	lr, [ip]
	ldr	r2, [r5, #20]
	strh	r1, [r3, #76]	@ movhi
	b	.L74
.L100:
	.align	2
.L99:
	.word	bullets
	.word	collision
	.word	player
	.word	cycleTime
	.word	1717986919
	.word	__aeabi_idivmod
	.word	shadowOAM
	.word	ghostMode
	.word	11025
	.word	9156
	.word	hitSFX
	.word	playSoundA
	.word	time
	.word	mosaic
	.word	timeWhenHit
	.size	updateObstacles, .-updateObstacles
	.align	2
	.global	updateBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullets, %function
updateBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #16]
	cmp	r2, #0
	bne	updateBullets.part.2
.L102:
	mov	r1, #512
	ldr	r3, [r0, #24]
	ldr	r2, .L103
	add	r3, r3, #50
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L104:
	.align	2
.L103:
	.word	shadowOAM
	.size	updateBullets, .-updateBullets
	.align	2
	.global	updatePolice
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePolice, %function
updatePolice:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, .L110
	push	{r4, r5, r6, lr}
	ldr	r3, [r0, #12]
	ldr	r4, [r0, #4]
	ldr	r2, [r2, #4]
	add	r3, r4, r3
	cmp	r3, r2
	mov	r5, r0
	bgt	.L109
.L106:
	ldr	r2, .L110+4
	ldr	r3, .L110+8
	ldr	r2, [r2]
	smull	r0, r1, r3, r2
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #2
	add	r3, r3, r3, lsl #2
	cmp	r2, r3, lsl #1
	ldr	r1, [r5, #24]
	bne	.L107
	add	r0, r1, #1
	ldr	r3, .L110+12
	ldr	r1, [r5, #28]
	mov	lr, pc
	bx	r3
	str	r1, [r5, #24]
.L107:
	lsl	r3, r4, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #18
	mvn	r3, r3, lsr #18
	ldr	r2, [r5, #20]
	ldrb	r0, [r5]	@ zero_extendqisi2
	ldr	lr, .L110+16
	lsl	r1, r1, #7
	add	r2, r2, #60
	lsl	r2, r2, #3
	add	r1, r1, #200
	add	ip, lr, r2
	orr	r1, r1, #9216
	orr	r0, r0, #16384
	strh	r0, [lr, r2]	@ movhi
	strh	r3, [ip, #2]	@ movhi
	strh	r1, [ip, #4]	@ movhi
	pop	{r4, r5, r6, lr}
	bx	lr
.L109:
	mov	r1, #1
	ldr	r2, .L110+20
	ldr	r3, .L110+24
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	ldr	r4, [r5, #4]
	b	.L106
.L111:
	.align	2
.L110:
	.word	player
	.word	cycleTime
	.word	1717986919
	.word	__aeabi_idivmod
	.word	shadowOAM
	.word	hasLost
	.word	hideSprites
	.size	updatePolice, .-updatePolice
	.align	2
	.global	fireBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L122
	mov	r2, #0
	mov	r1, r0
	b	.L115
.L113:
	add	r2, r2, #1
	cmp	r2, #20
	add	r1, r1, #28
	bxeq	lr
.L115:
	ldr	r3, [r1, #16]
	cmp	r3, #0
	bne	.L113
	push	{r4, r5, r6, lr}
	mov	r4, #1
	ldr	ip, .L122+4
	rsb	r2, r2, r2, lsl #3
	ldm	ip, {r1, ip}
	lsl	r2, r2, #2
	add	lr, r0, r2
	sub	r1, r1, #1
	add	ip, ip, #40
	str	r1, [r0, r2]
	str	ip, [lr, #4]
	ldr	r5, .L122+8
	str	r4, [lr, #16]
	ldr	r2, .L122+12
	ldr	r1, .L122+16
	ldr	r0, .L122+20
	mov	lr, pc
	bx	r5
	ldr	r3, .L122+24
	str	r4, [r3, #20]
	pop	{r4, r5, r6, lr}
	bx	lr
.L123:
	.align	2
.L122:
	.word	bullets
	.word	player
	.word	playSoundA
	.word	11025
	.word	27200
	.word	ump45
	.word	uzi
	.size	fireBullet, .-fireBullet
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r6, .L192
	ldr	r3, [r6, #20]
	cmp	r3, #1
	str	r3, [r6, #24]
	moveq	r3, #0
	ldr	r8, .L192+4
	streq	r3, [r6, #20]
	ldrh	r3, [r8]
	ldr	r4, .L192+8
	tst	r3, #64
	ldr	r1, [r4]
	beq	.L126
	ldr	r2, .L192+12
	ldrh	r2, [r2]
	tst	r2, #64
	beq	.L185
.L126:
	ldr	r2, [r4, #20]
	rsb	r0, r2, #256
	cmp	r0, r1
	ble	.L127
	ldr	r0, [r4, #8]
	add	r2, r2, r1
	add	r2, r2, r0, asr #8
	cmp	r2, #103
	addle	r0, r0, #40
	strle	r0, [r4, #8]
	bgt	.L127
	ldr	r2, [r4, #40]
	cmp	r2, #1
	and	r3, r3, #1
	beq	.L177
.L188:
	ldr	r7, .L192+16
	ldr	r5, .L192+20
.L130:
	cmp	r3, #0
	beq	.L182
	ldr	r3, .L192+12
	ldrh	r3, [r3]
	tst	r3, #1
	beq	.L178
.L182:
	ldr	r8, .L192+24
.L138:
	ldr	r2, .L192+28
	ldrh	r3, [r2, #48]
	ands	r3, r3, #2
	bne	.L142
	mov	r1, #512
	mov	r0, #1
	ldr	ip, .L192+32
	strh	r1, [r5, #160]	@ movhi
	str	r0, [ip]
	strh	r1, [r5, #168]	@ movhi
	strh	r1, [r5, #176]	@ movhi
	strh	r1, [r5, #184]	@ movhi
	ldr	ip, .L192+36
	ldr	r1, .L192+40
	ldrh	r2, [r2, #48]
	str	r3, [ip]
	str	r3, [r1]
	ldr	ip, .L192+44
	ldr	r1, .L192+48
	tst	r2, #1
	str	r3, [ip]
	str	r3, [r1]
	str	r3, [r4, #40]
	str	r0, [r8]
	beq	.L186
.L144:
	ldr	r3, .L192+52
	ldr	r2, [r3]
	ldr	r1, [r7]
	ldr	r0, [r4, #8]
	add	ip, r2, #3
	ldr	r3, [r4]
	cmp	ip, r1
	add	r3, r3, r0, asr #8
	movlt	r0, #0
	movlt	ip, r0
	strlt	r0, [r4, #32]
	add	r0, r2, #9
	ldrge	ip, [r4, #32]
	cmp	r1, r0
	str	r3, [r4]
	ble	.L183
	add	r2, r2, #14
	cmp	r1, r2
	ble	.L149
.L183:
	mov	r2, #0
	ldr	r1, .L192+56
	ldr	r0, [r1]
	str	r2, [r4, #36]
	asr	lr, r0, #31
.L148:
	ldr	r2, .L192+60
	smull	r7, r9, r0, r2
	rsb	r2, lr, r9, asr #1
	add	r2, r2, r2, lsl #2
	cmp	r0, r2
	bne	.L150
	ldr	r7, .L192+64
	ldr	r2, [r7]
	cmp	r2, #0
	ble	.L150
	mov	r9, #67108864
	sub	r2, r2, #1
	str	r2, [r7]
	lsl	r7, r2, #12
	orr	r2, r7, r2, lsl #8
	strh	r2, [r9, #76]	@ movhi
.L150:
	cmp	ip, #0
	and	r2, r3, #255
	beq	.L151
	ldr	ip, .L192+68
	smull	r7, r9, r0, ip
	sub	ip, r9, lr
	add	ip, ip, ip, lsl #1
	cmp	r0, ip, lsl #1
	beq	.L187
.L151:
	orr	r0, r2, #20480
	orr	r2, r2, #4096
	strh	r0, [r5, #200]	@ movhi
	strh	r2, [r5]	@ movhi
.L152:
	ldr	r7, [r4, #4]
	lsl	r2, r7, #23
	lsr	r2, r2, #23
	mvn	r2, r2, lsl #18
	mvn	r2, r2, lsr #18
	cmp	r3, #88
	strh	r2, [r5, #202]	@ movhi
	beq	.L153
	sub	r2, r3, #128
	rsbs	r3, r2, #0
	adc	r3, r3, r2
	ldr	r2, .L192+72
	ldr	r2, [r2]
	cmp	r2, #0
	moveq	r3, #0
	cmp	r3, #0
	moveq	r1, r3
	streq	r3, [r4, #24]
	bne	.L153
.L156:
	ldr	r3, [r8]
	cmp	r3, #0
	ldr	r2, [r6, #20]
	addne	r3, r1, #14
	addeq	r3, r1, #6
	add	r7, r7, #35
	lsl	r3, r3, #21
	lsl	r7, r7, #23
	orr	r3, r3, #603979776
	lsr	r7, r7, #23
	lsl	r2, r2, #6
	lsr	r3, r3, #16
	orr	r7, r7, #16384
	orr	r2, r2, #4096
	strh	r7, [r5, #2]	@ movhi
	strh	r2, [r5, #4]	@ movhi
	strh	r3, [r5, #204]	@ movhi
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L127:
	ldr	r2, .L192+72
	ldr	r2, [r2]
	cmp	r2, #0
	movne	r2, #128
	moveq	r1, #88
	movne	r1, #0
	streq	r2, [r4, #8]
	strne	r2, [r4]
	ldr	r2, [r4, #40]
	streq	r1, [r4]
	strne	r1, [r4, #8]
	cmp	r2, #1
	and	r3, r3, #1
	bne	.L188
.L177:
	cmp	r3, #0
	beq	.L131
	ldr	r3, .L192+12
	ldrh	r3, [r3]
	ands	r3, r3, #1
	bne	.L131
	ldr	r2, .L192+76
	ldr	r1, .L192+80
	ldr	r0, .L192+84
	ldr	r5, .L192+88
	mov	lr, pc
	bx	r5
.L131:
	ldr	r9, .L192+92
	ldr	r7, .L192+16
	ldr	r2, [r9]
	ldr	r1, [r7]
	add	r3, r2, #7
	cmp	r3, r1
	blt	.L132
	mov	r0, #208
	ldr	r5, .L192+20
	ldr	ip, .L192+96
	ldr	r3, .L192+100
	strh	ip, [r5, #160]	@ movhi
	add	ip, r2, #2
	cmp	r1, ip
	strh	r0, [r5, #164]	@ movhi
	strh	r3, [r5, #162]	@ movhi
	ble	.L133
	ldr	r10, .L192+40
	ldr	r3, [r10]
	cmp	r3, #0
	beq	.L189
.L133:
	add	r3, r2, #4
	cmp	r3, r1
	bge	.L134
	ldr	r10, .L192+44
	ldr	r3, [r10]
	cmp	r3, #0
	beq	.L190
.L134:
	add	r2, r2, #6
	cmp	r2, r1
	bge	.L136
	ldr	r9, .L192+48
	ldr	r3, [r9]
	cmp	r3, #0
	beq	.L191
.L136:
	ldrh	r3, [r8]
	and	r3, r3, #1
	b	.L130
.L149:
	mov	r7, #1
	ldr	r1, .L192+56
	ldr	r2, .L192+60
	ldr	r0, [r1]
	smull	lr, r9, r0, r2
	asr	lr, r0, #31
	rsb	r2, lr, r9, asr #2
	add	r2, r2, r2, lsl #2
	cmp	r0, r2, lsl r7
	str	r7, [r4, #36]
	bne	.L148
	ldr	r2, [r4, #4]
	cmp	r2, #72
	addne	r2, r2, r7
	strne	r2, [r4, #4]
	b	.L148
.L178:
	ldr	r3, [r4, #40]
	cmp	r3, #0
	ldr	r8, .L192+24
	bne	.L138
	bl	fireBullet
	ldr	r3, [r8]
	cmp	r3, #0
	ldreq	r2, .L192+36
	ldrne	r3, .L192+36
	ldreq	r3, [r2]
	ldrne	r3, [r3]
	addeq	r3, r3, #1
	streq	r3, [r2]
	cmp	r3, #3
	moveq	r1, #1
	ldreq	r3, .L192+92
	ldreq	r2, [r7]
	streq	r1, [r4, #40]
	streq	r2, [r3]
	b	.L138
.L185:
	cmp	r1, #88
	ldreq	r2, [r4, #8]
	subeq	r2, r2, #1000
	streq	r2, [r4, #8]
	b	.L126
.L187:
	orr	r0, r2, #20992
	orr	r2, r2, #4608
	strh	r0, [r5, #200]	@ movhi
	strh	r2, [r5]	@ movhi
	b	.L152
.L142:
	mov	r3, #0
	ldr	r1, .L192+32
	str	r3, [r8]
	str	r3, [r1]
	ldrh	r3, [r2, #48]
	b	.L144
.L153:
	ldr	r2, [r1]
	ldr	r3, .L192+60
	smull	r0, r1, r3, r2
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #2
	add	r3, r3, r3, lsl #2
	cmp	r2, r3, lsl #1
	ldr	r1, [r4, #24]
	bne	.L184
	add	r0, r1, #1
	ldr	r3, .L192+104
	ldr	r1, [r4, #28]
	mov	lr, pc
	bx	r3
	str	r1, [r4, #24]
.L184:
	lsl	r1, r1, #2
	b	.L156
.L132:
	mov	r1, #512
	mov	r2, #0
	ldr	r5, .L192+20
	ldrh	r3, [r8]
	ldr	r0, .L192+36
	strh	r1, [r5, #160]	@ movhi
	strh	r1, [r5, #168]	@ movhi
	strh	r1, [r5, #176]	@ movhi
	strh	r1, [r5, #184]	@ movhi
	ldr	r1, .L192+40
	str	r2, [r0]
	str	r2, [r1]
	ldr	r0, .L192+44
	ldr	r1, .L192+48
	str	r2, [r4, #40]
	str	r2, [r0]
	str	r2, [r1]
	and	r3, r3, #1
	b	.L130
.L186:
	bl	fireBullet
	b	.L144
.L189:
	mov	lr, #216
	ldr	ip, .L192+108
	ldr	r2, .L192+76
	ldr	r1, .L192+112
	strh	r0, [r5, #170]	@ movhi
	strh	lr, [r5, #172]	@ movhi
	ldr	r0, .L192+116
	ldr	fp, .L192+88
	strh	ip, [r5, #168]	@ movhi
	mov	lr, pc
	bx	fp
	mov	r3, #1
	ldr	r2, [r9]
	str	r3, [r10]
	ldr	r1, [r7]
	b	.L133
.L191:
	mov	r0, #224
	mov	lr, #216
	ldr	ip, .L192+108
	ldr	r2, .L192+76
	strh	r0, [r5, #186]	@ movhi
	ldr	r1, .L192+120
	ldr	r0, .L192+124
	strh	lr, [r5, #188]	@ movhi
	ldr	r10, .L192+88
	strh	ip, [r5, #184]	@ movhi
	mov	lr, pc
	bx	r10
	mov	r2, #1
	ldrh	r3, [r8]
	str	r2, [r9]
	and	r3, r3, r2
	b	.L130
.L190:
	mov	lr, #216
	ldr	ip, .L192+108
	ldr	r2, .L192+76
	ldr	r1, .L192+112
	ldr	r0, .L192+116
	strh	lr, [r5, #178]	@ movhi
	strh	lr, [r5, #180]	@ movhi
	ldr	fp, .L192+88
	strh	ip, [r5, #176]	@ movhi
	mov	lr, pc
	bx	fp
	mov	r3, #1
	ldr	r2, [r9]
	str	r3, [r10]
	ldr	r1, [r7]
	b	.L134
.L193:
	.align	2
.L192:
	.word	uzi
	.word	oldButtons
	.word	player
	.word	buttons
	.word	time
	.word	shadowOAM
	.word	ghostMode
	.word	67109120
	.word	infiniteAmmo
	.word	bulletsFired
	.word	alreadyExecuted1
	.word	alreadyExecuted2
	.word	alreadyExecuted3
	.word	timeWhenHit
	.word	cycleTime
	.word	1717986919
	.word	mosaic
	.word	715827883
	.word	instructions
	.word	11025
	.word	3076
	.word	dryfire
	.word	playSoundA
	.word	timeWhenReload
	.word	20624
	.word	-16240
	.word	__aeabi_idivmod
	.word	4240
	.word	2740
	.word	reload1
	.word	3444
	.word	reload2
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateInstructions
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateInstructions, %function
updateInstructions:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L202
	bl	updatePlayer
	mov	r7, #512
	ldr	r6, .L202+4
	add	r5, r4, #560
	b	.L197
.L201:
	mov	r0, r4
	add	r4, r4, #28
	bl	updateBullets.part.2
	cmp	r5, r4
	beq	.L200
.L197:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bne	.L201
	ldr	r3, [r4, #24]
	add	r4, r4, #28
	add	r3, r3, #50
	lsl	r3, r3, #3
	cmp	r5, r4
	strh	r7, [r6, r3]	@ movhi
	bne	.L197
.L200:
	ldr	r0, .L202+8
	bl	updatePolice
	ldr	r0, .L202+12
	bl	updatePolice
	ldr	r0, .L202+16
	bl	updatePolice
	mov	ip, #16
	mov	r0, #48
	ldr	r2, .L202+20
	ldr	r1, .L202+24
	strh	ip, [r6, #10]	@ movhi
	strh	r2, [r6, #12]	@ movhi
	ldr	ip, .L202+28
	ldr	r2, .L202+32
	ldr	r3, .L202+36
	strh	r0, [r6, #18]	@ movhi
	strh	r1, [r6, #8]	@ movhi
	sub	r0, r0, #32768
	add	r1, r1, #16
	strh	r3, [r6, #16]	@ movhi
	strh	ip, [r6, #20]	@ movhi
	strh	r0, [r6, #24]	@ movhi
	strh	r1, [r6, #26]	@ movhi
	strh	r2, [r6, #28]	@ movhi
	ldr	r3, .L202+40
	mov	lr, pc
	bx	r3
	ldr	r4, .L202+44
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L202+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L202+48
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L203:
	.align	2
.L202:
	.word	bullets
	.word	shadowOAM
	.word	police
	.word	police+32
	.word	police+64
	.word	7177
	.word	16448
	.word	1049
	.word	1050
	.word	-32712
	.word	waitForVBlank
	.word	DMANow
	.word	cycleTime
	.size	updateInstructions, .-updateInstructions
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #67108864
	push	{r4, r5, r6, r7, r8, lr}
	ldr	lr, .L218
	ldr	r0, [lr]
	ldr	ip, .L218+4
	add	r0, r0, #768
	ldr	r3, [ip]
	asr	r2, r0, #8
	str	r0, [lr]
	lsl	r2, r2, #16
	ldr	r0, .L218+8
	lsr	r2, r2, #16
	add	r3, r3, #64
	str	r3, [ip]
	strh	r2, [r1, #16]	@ movhi
	ldr	r2, [r0]
	asr	r2, r2, #8
	lsl	r2, r2, #16
	lsr	r2, r2, #16
	asr	r3, r3, #8
	strh	r2, [r1, #18]	@ movhi
	lsl	r3, r3, #16
	ldr	r2, .L218+12
	lsr	r3, r3, #16
	strh	r3, [r1, #28]	@ movhi
	ldr	r3, [r2]
	asr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [r1, #30]	@ movhi
	ldr	r4, .L218+16
	bl	updatePlayer
	mov	lr, pc
	bx	r4
	ldr	r3, .L218+20
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	cmp	r0, r3, lsl #2
	beq	.L215
.L206:
	ldr	r4, .L218+24
	add	r5, r4, #600
.L208:
	mov	r0, r4
	add	r4, r4, #60
	bl	updateObstacles
	cmp	r4, r5
	bne	.L208
	ldr	r4, .L218+28
	mov	r7, #512
	ldr	r6, .L218+32
	add	r5, r4, #560
	b	.L211
.L217:
	mov	r0, r4
	add	r4, r4, #28
	bl	updateBullets.part.2
	cmp	r5, r4
	beq	.L216
.L211:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bne	.L217
	ldr	r3, [r4, #24]
	add	r4, r4, #28
	add	r3, r3, #50
	lsl	r3, r3, #3
	cmp	r5, r4
	strh	r7, [r6, r3]	@ movhi
	bne	.L211
.L216:
	ldr	r0, .L218+36
	bl	updatePolice
	ldr	r0, .L218+40
	bl	updatePolice
	ldr	r0, .L218+44
	bl	updatePolice
	bl	updateScore
	ldr	r3, .L218+48
	mov	lr, pc
	bx	r3
	ldr	r4, .L218+52
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L218+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L218+56
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L215:
	mov	lr, pc
	bx	r4
	ldr	r3, .L218+60
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #1
	rsb	r3, r3, r3, lsl #4
	ldr	r2, .L218+24
	lsl	r3, r3, #2
	add	r4, r2, r3
	ldr	r1, [r4, #36]
	cmp	r1, #0
	bne	.L206
	ldr	r1, [r2, r3]
	mov	r0, r4
	ldr	r2, [r4, #4]
	bl	initObstacle
	mov	r3, #1
	str	r3, [r4, #36]
	b	.L206
.L219:
	.align	2
.L218:
	.word	hOffBG0
	.word	hOffBG3
	.word	vOffBG0
	.word	vOffBG3
	.word	rand
	.word	1374389535
	.word	obs
	.word	bullets
	.word	shadowOAM
	.word	police
	.word	police+32
	.word	police+64
	.word	waitForVBlank
	.word	DMANow
	.word	cycleTime
	.word	1717986919
	.size	updateGame, .-updateGame
	.align	2
	.global	setup_int_in_one_minute
	.syntax unified
	.arm
	.fpu softvfp
	.type	setup_int_in_one_minute, %function
setup_int_in_one_minute:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #0
	mov	lr, #57344
	mvn	ip, #119
	mov	r0, #195
	mov	r1, #132
	ldr	r3, .L222
	strh	r2, [r3, #10]	@ movhi
	strh	r2, [r3, #14]	@ movhi
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r3, #12]	@ movhi
	ldr	lr, [sp], #4
	strh	r0, [r3, #10]	@ movhi
	strh	r1, [r3, #14]	@ movhi
	bx	lr
.L223:
	.align	2
.L222:
	.word	67109120
	.size	setup_int_in_one_minute, .-setup_int_in_one_minute
	.align	2
	.global	setupTimeInterrupts
	.syntax unified
	.arm
	.fpu softvfp
	.type	setupTimeInterrupts, %function
setupTimeInterrupts:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #1
	push	{r4, r5, lr}
	mov	r0, #0
	mov	r5, #57344
	mvn	r4, #119
	mov	lr, #195
	mov	ip, #132
	ldr	r2, .L226
	strh	r1, [r2, #8]	@ movhi
	ldrh	r1, [r2]
	ldr	r3, .L226+4
	orr	r1, r1, #32
	strh	r0, [r3, #10]	@ movhi
	strh	r1, [r2]	@ movhi
	strh	r0, [r3, #14]	@ movhi
	strh	r5, [r3, #8]	@ movhi
	strh	r4, [r3, #12]	@ movhi
	strh	lr, [r3, #10]	@ movhi
	strh	ip, [r3, #14]	@ movhi
	pop	{r4, r5, lr}
	bx	lr
.L227:
	.align	2
.L226:
	.word	67109376
	.word	67109120
	.size	setupTimeInterrupts, .-setupTimeInterrupts
	.comm	vOffBG3,4,4
	.comm	hOffBG3,4,4
	.comm	vOffBG0,4,4
	.comm	hOffBG0,4,4
	.comm	instructions,4,4
	.comm	alreadyExecuted3,4,4
	.comm	alreadyExecuted2,4,4
	.comm	alreadyExecuted1,4,4
	.comm	bulletsFired,4,4
	.comm	mosaic,4,4
	.comm	timeWhenReload,4,4
	.comm	timeWhenHit,4,4
	.comm	cycleTime,4,4
	.comm	time,4,4
	.comm	hasLost,4,4
	.comm	infiniteAmmo,4,4
	.comm	ghostMode,4,4
	.comm	bullets,560,4
	.comm	obs,600,4
	.comm	police,96,4
	.comm	uzi,36,4
	.comm	player,44,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 50) 8.2.0"
