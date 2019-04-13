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
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	mov	r2, #1
	mov	lr, #80
	mov	ip, #90
	mov	r0, #16
	mov	r1, #32
	ldr	r3, .L13
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r0, [r3, #20]
	str	r1, [r3, #16]
	str	r2, [r3, #12]
	str	r2, [r3, #8]
	ldr	lr, [sp], #4
	bx	lr
.L14:
	.align	2
.L13:
	.word	player
	.size	initPlayer, .-initPlayer
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
	mov	ip, #1
	push	{r4, r5, r6, lr}
	mov	r5, #32
	mov	r4, #16
	mov	lr, #88
	ldr	r2, .L17
	ldr	r6, [r2, #16]
	ldr	r3, [r2, #4]
	sub	r3, r3, r6, lsl ip
	sub	r3, r3, #16
	str	r5, [r0, #12]
	str	r4, [r0, #16]
	str	lr, [r0]
	str	r1, [r0, #20]
	stmib	r0, {r3, ip}
	pop	{r4, r5, r6, lr}
	bx	lr
.L18:
	.align	2
.L17:
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
	str	lr, [sp, #-4]!
	mov	ip, #1
	mov	lr, #3
	mov	r3, #0
	stm	r0, {r1, r2, lr}
	str	ip, [r0, #12]
	str	r3, [r0, #36]
	cmp	r2, lr
	ldrls	pc, [pc, r2, asl #2]
	b	.L19
.L22:
	.word	.L25
	.word	.L24
	.word	.L23
	.word	.L21
.L21:
	mov	lr, #8
	mov	ip, #24
	mvn	r1, #0
	mov	r2, #80
.L27:
	mov	r3, #240
	str	lr, [r0, #32]
	str	ip, [r0, #28]
	str	r1, [r0, #24]
	str	r2, [r0, #16]
	str	r3, [r0, #20]
.L19:
	ldr	lr, [sp], #4
	bx	lr
.L23:
	mov	lr, #8
	mov	ip, #16
	mvn	r1, #0
	mov	r2, #88
	b	.L27
.L24:
	mov	r3, #8
	mvn	ip, #1
	mov	r1, #64
	mov	r2, #240
	str	r3, [r0, #32]
	str	r3, [r0, #28]
	str	ip, [r0, #24]
	str	r1, [r0, #16]
	str	r2, [r0, #20]
	ldr	lr, [sp], #4
	bx	lr
.L25:
	mov	lr, #32
	mov	ip, #8
	mvn	r1, #0
	mov	r2, #96
	b	.L27
	.size	initObstacle, .-initObstacle
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
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r8, #16
	mov	r7, #32
	mov	r5, #0
	mov	r3, #1
	mov	r9, #12288
	mov	fp, #80
	mov	r10, #90
	mov	lr, r8
	mov	ip, r7
	mov	r0, #88
	mov	r1, #10
	ldr	r6, .L36
	str	r5, [r6]
	ldr	r6, .L36+4
	str	r5, [r6]
	ldr	r6, .L36+8
	mov	r4, r3
	str	r3, [r6, #12]
	str	r3, [r6, #8]
	ldr	r3, .L36+12
	mov	r2, r5
	str	r9, [r3]
	ldr	r5, .L36+16
	ldr	r3, .L36+20
	str	fp, [r6]
	str	r5, [r3]
	str	r10, [r6, #4]
	str	r8, [r6, #20]
	str	r7, [r6, #16]
	ldr	r3, .L36+24
.L29:
	add	r2, r2, #1
	cmp	r2, #3
	str	r2, [r3, #20]
	str	ip, [r3, #12]
	str	lr, [r3, #16]
	stm	r3, {r0, r1, r4}
	add	r3, r3, #48
	bne	.L29
	mov	r2, #0
	ldr	r4, .L36+28
.L30:
	add	r5, r2, #1
	mov	r0, r4
	and	r2, r2, #3
	mov	r1, r5
	bl	initObstacle
	cmp	r5, #6
	mov	r2, r5
	add	r4, r4, #60
	bne	.L30
	mov	r2, #0
	mov	r1, #8
	mov	r0, r2
	ldr	ip, [r6, #4]
	ldr	r4, [r6, #16]
	ldr	lr, [r6]
	ldr	r3, .L36+32
	add	ip, ip, r4
.L31:
	add	r2, r2, #1
	cmp	r2, #3
	str	r2, [r3, #24]
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r1, [r3, #20]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	r0, [r3, #16]
	add	r3, r3, #28
	bne	.L31
	ldr	r3, .L36+36
	ldr	r1, .L36+40
	ldr	r2, .L36+44
	str	r0, [r3]
	str	r0, [r1]
	str	r0, [r2]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L37:
	.align	2
.L36:
	.word	hOffBG0
	.word	hOffBG3
	.word	player
	.word	vOffBG3
	.word	75520
	.word	vOffBG0
	.word	police
	.word	obs
	.word	bullets
	.word	ghostMode
	.word	score
	.word	hasLost
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
	ldr	r3, .L42
	ldr	r0, [r3, #4]
	ldr	r4, [r3, #16]
	ldr	ip, [r3]
	ldr	r3, .L42+4
	add	r0, r0, r4
.L39:
	add	r2, r2, #1
	cmp	r2, #3
	str	r2, [r3, #24]
	str	ip, [r3]
	str	r0, [r3, #4]
	str	r1, [r3, #20]
	str	r1, [r3, #8]
	str	r1, [r3, #12]
	str	lr, [r3, #16]
	add	r3, r3, #28
	bne	.L39
	pop	{r4, lr}
	bx	lr
.L43:
	.align	2
.L42:
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
	bl	initObstacle
	mov	r3, #1
	pop	{r4, lr}
	str	r3, [r0, #36]
	bx	lr
	.size	spawnObstacle, .-spawnObstacle
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
	ldr	r3, .L62
	ldrh	r2, [r3, #48]
	tst	r2, #64
	push	{r4, lr}
	bne	.L47
	mov	r3, #64
	mov	r0, r3
	ldr	r2, .L62+4
	ldr	lr, .L62+8
	str	r3, [r2]
.L48:
	ldr	r3, .L62+12
	ldrh	r3, [r3]
	tst	r3, #1
	ldr	r3, [r2, #4]
	beq	.L50
	ldr	r1, .L62+16
	ldrh	r1, [r1]
	tst	r1, #1
	bne	.L50
	ldr	r1, .L62+20
	ldr	ip, [r1, #16]
	cmp	ip, #0
	beq	.L51
	ldr	ip, [r1, #44]
	cmp	ip, #0
	beq	.L53
	ldr	ip, [r1, #72]
	cmp	ip, #0
	moveq	ip, #2
	beq	.L51
.L50:
	mvn	r3, r3, lsl #17
	ldr	r2, .L62
	ldrh	r2, [r2, #48]
	and	r2, r2, #2
	cmp	r2, #0
	mvn	r3, r3, lsr #17
	moveq	ip, #1088
	movne	ip, #1024
	moveq	r0, #1
	movne	r0, #0
	ldr	r2, .L62+24
	ldr	r1, .L62+28
	strh	lr, [r2]	@ movhi
	strh	r3, [r2, #2]	@ movhi
	strh	ip, [r2, #4]	@ movhi
	pop	{r4, lr}
	str	r0, [r1]
	bx	lr
.L47:
	ldrh	r3, [r3, #48]
	tst	r3, #128
	moveq	r3, #88
	movne	r3, #80
	ldreq	r2, .L62+4
	ldrne	r2, .L62+4
	moveq	r0, r3
	streq	r3, [r2]
	ldreq	lr, .L62+32
	movne	r0, r3
	ldrne	lr, .L62+36
	strne	r3, [r2]
	b	.L48
.L53:
	mov	ip, #1
.L51:
	mov	r4, #1
	ldr	r2, [r2, #16]
	rsb	ip, ip, ip, lsl #3
	lsl	ip, ip, #2
	add	r2, r3, r2
	sub	r2, r2, #1
	str	r0, [r1, ip]
	add	r1, r1, ip
	str	r2, [r1, #4]
	str	r4, [r1, #16]
	b	.L50
.L63:
	.align	2
.L62:
	.word	67109120
	.word	player
	.word	16448
	.word	oldButtons
	.word	buttons
	.word	bullets
	.word	shadowOAM
	.word	ghostMode
	.word	16472
	.word	16464
	.size	updatePlayer, .-updatePlayer
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
	ldr	r2, [r0, #32]
	ldr	r3, [r0, #20]
	rsb	r1, r2, #0
	cmp	r3, r1
	movle	r3, #0
	strle	r3, [r0, #36]
	ble	.L66
	ldr	r1, [r0, #36]
	cmp	r1, #0
	beq	.L66
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	mov	r8, #0
	ldr	r5, .L92
	ldr	r0, [r0, #16]
	ldr	ip, [r4, #28]
	ldr	r7, .L92+4
	sub	sp, sp, #16
	add	r6, r5, #84
.L69:
	ldr	r1, [r5, #16]
	cmp	r1, #0
	bne	.L91
.L67:
	add	r5, r5, #28
	cmp	r5, r6
	bne	.L69
	stm	sp, {r0, r3, ip}
	str	r2, [sp, #12]
	ldr	r5, .L92+8
	ldr	r3, [r5, #16]
	ldr	r2, [r5, #20]
	ldm	r5, {r0, r1}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L70
	ldr	r3, .L92+12
	ldr	r3, [r3]
	cmp	r3, #0
	ldreq	r3, [r5, #4]
	ldreq	r2, [r5, #16]
	subeq	r3, r3, r2
	streq	r3, [r5, #4]
.L70:
	add	r2, r4, #20
	ldmia	r2, {r2, r3}
	add	r3, r2, r3
	ldr	r2, [r4, #4]
	str	r3, [r4, #20]
	cmp	r2, #3
	ldrls	pc, [pc, r2, asl #2]
	b	.L64
.L73:
	.word	.L76
	.word	.L75
	.word	.L74
	.word	.L72
.L72:
	ldrb	r2, [r4, #16]	@ zero_extendqisi2
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, [r4]
	ldr	ip, .L92+16
	lsl	r3, r3, #23
	lsl	r1, r1, #3
	lsr	r3, r3, #23
	ldr	lr, .L92+20
	add	r0, ip, r1
	orr	r3, r3, #16384
	strh	r2, [ip, r1]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	strh	lr, [r0, #4]	@ movhi
.L64:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L66:
	mov	r1, #512
	ldr	r3, [r0]
	ldr	r2, .L92+16
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L91:
	stm	sp, {r0, r3, ip}
	str	r2, [sp, #12]
	ldm	r5, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L68
	add	r0, r4, #16
	ldm	r0, {r0, r3}
	ldr	ip, [r4, #28]
	ldr	r2, [r4, #32]
	b	.L67
.L68:
	str	r8, [r5, #16]
	ldr	r3, [r4, #8]
	sub	r3, r3, #1
	cmp	r3, #0
	add	r0, r4, #16
	str	r3, [r4, #8]
	ldr	ip, [r4, #28]
	ldm	r0, {r0, r3}
	ldr	r2, [r4, #32]
	strle	r8, [r4, #36]
	b	.L67
.L74:
	ldrb	r2, [r4, #16]	@ zero_extendqisi2
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, [r4]
	ldr	ip, .L92+16
	lsl	r1, r1, #3
	ldr	lr, .L92+24
	lsl	r3, r3, #23
	add	r0, ip, r1
	lsr	r3, r3, #23
	strh	r2, [ip, r1]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	strh	lr, [r0, #4]	@ movhi
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L75:
	ldr	r2, [r4]
	ldr	r0, .L92+16
	ldrb	lr, [r4, #16]	@ zero_extendqisi2
	lsl	r2, r2, #3
	ldr	ip, .L92+28
	lsl	r3, r3, #23
	add	r1, r0, r2
	lsr	r3, r3, #23
	strh	lr, [r0, r2]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	strh	ip, [r1, #4]	@ movhi
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L76:
	ldr	r2, [r4]
	ldrb	r1, [r4, #16]	@ zero_extendqisi2
	ldr	ip, .L92+16
	lsl	r3, r3, #23
	lsl	r2, r2, #3
	ldr	lr, .L92+32
	lsr	r3, r3, #23
	add	r0, ip, r2
	orr	r3, r3, #16384
	orr	r1, r1, #16384
	strh	r1, [ip, r2]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	strh	lr, [r0, #4]	@ movhi
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L93:
	.align	2
.L92:
	.word	bullets
	.word	collision
	.word	player
	.word	ghostMode
	.word	shadowOAM
	.word	1066
	.word	1065
	.word	1031
	.word	3081
	.size	updateObstacles, .-updateObstacles
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
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	lr, .L111
	ldr	r0, [lr]
	ldr	ip, .L111+4
	add	r0, r0, #768
	ldr	r3, [ip]
	asr	r2, r0, #8
	str	r0, [lr]
	lsl	r2, r2, #16
	ldr	r0, .L111+8
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
	ldr	r2, .L111+12
	lsr	r3, r3, #16
	strh	r3, [r1, #28]	@ movhi
	ldr	r3, [r2]
	asr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [r1, #30]	@ movhi
	ldr	r4, .L111+16
	bl	updatePlayer
	mov	lr, pc
	bx	r4
	ldr	r3, .L111+20
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	cmp	r0, r3, lsl #2
	beq	.L110
.L96:
	ldr	r0, .L111+24
	bl	updateObstacles
	ldr	r0, .L111+28
	bl	updateObstacles
	ldr	r0, .L111+32
	bl	updateObstacles
	ldr	r0, .L111+36
	bl	updateObstacles
	ldr	r0, .L111+40
	bl	updateObstacles
	ldr	r0, .L111+44
	bl	updateObstacles
	mov	r7, #512
	ldr	r4, .L111+48
	ldr	r5, .L111+52
	add	r6, r4, #84
.L100:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L98
	mov	r0, r4
	bl	updateBullets.part.2
.L99:
	add	r4, r4, #28
	cmp	r4, r6
	bne	.L100
	mov	r0, #0
	mov	r7, #1152
	ldr	r3, .L111+56
	ldr	r9, .L111+60
	ldr	r1, .L111+64
	ldr	r6, [r3, #4]
	ldr	r8, [r9]
	ldr	r4, .L111+68
	ldr	lr, .L111+72
	add	ip, r1, #144
.L102:
	ldr	r3, [r1, #4]
	ldr	r2, [r1, #12]
	add	r2, r3, r2
	cmp	r2, r6
	movgt	r0, #1
	and	r3, r3, r4
	orr	r2, r3, lr
	ldr	r3, [r1, #20]
	ldrb	r10, [r1], #48	@ zero_extendqisi2
	add	r3, r3, #60
	lsl	r3, r3, #3
	add	fp, r5, r3
	movgt	r8, r0
	orr	r10, r10, #16384
	cmp	r1, ip
	strh	r10, [r5, r3]	@ movhi
	strh	r2, [fp, #2]	@ movhi
	strh	r7, [fp, #4]	@ movhi
	bne	.L102
	cmp	r0, #0
	ldr	r3, .L111+76
	strne	r8, [r9]
	ldr	r4, .L111+80
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L111+52
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L111+84
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L98:
	ldr	r3, [r4, #24]
	add	r3, r3, #50
	lsl	r3, r3, #3
	strh	r7, [r5, r3]	@ movhi
	b	.L99
.L110:
	mov	lr, pc
	bx	r4
	ldr	r3, .L111+88
	smull	r2, r1, r0, r3
	sub	r3, r1, r0, asr #31
	add	r3, r3, r3, lsl #1
	sub	r3, r0, r3, lsl #1
	rsb	r3, r3, r3, lsl #4
	ldr	r2, .L111+24
	lsl	r3, r3, #2
	add	r4, r2, r3
	ldr	r1, [r4, #36]
	cmp	r1, #0
	bne	.L96
	ldr	r1, [r2, r3]
	mov	r0, r4
	ldr	r2, [r4, #4]
	bl	initObstacle
	mov	r3, #1
	str	r3, [r4, #36]
	b	.L96
.L112:
	.align	2
.L111:
	.word	hOffBG0
	.word	hOffBG3
	.word	vOffBG0
	.word	vOffBG3
	.word	rand
	.word	1374389535
	.word	obs
	.word	obs+60
	.word	obs+120
	.word	obs+180
	.word	obs+240
	.word	obs+300
	.word	bullets
	.word	shadowOAM
	.word	player
	.word	hasLost
	.word	police
	.word	511
	.word	-32768
	.word	waitForVBlank
	.word	DMANow
	.word	score
	.word	715827883
	.size	updateGame, .-updateGame
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
.L114:
	mov	r1, #512
	ldr	r3, [r0, #24]
	ldr	r2, .L115
	add	r3, r3, #50
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L116:
	.align	2
.L115:
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
	ldr	r3, [r0, #4]
	ldr	r2, [r0, #12]
	add	r2, r3, r2
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	ldr	r1, .L120
	ldr	r1, [r1, #4]
	cmp	r2, r1
	movgt	r1, #1
	str	lr, [sp, #-4]!
	mvn	r3, r3, lsr #17
	mov	lr, #1152
	ldrgt	r2, .L120+4
	strgt	r1, [r2]
	ldr	r2, [r0, #20]
	ldrb	r1, [r0]	@ zero_extendqisi2
	ldr	ip, .L120+8
	add	r2, r2, #60
	lsl	r2, r2, #3
	add	r0, ip, r2
	orr	r1, r1, #16384
	strh	r1, [ip, r2]	@ movhi
	strh	lr, [r0, #4]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L121:
	.align	2
.L120:
	.word	player
	.word	hasLost
	.word	shadowOAM
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
	ldr	r3, .L133
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L123
	ldr	r2, [r3, #44]
	cmp	r2, #0
	beq	.L125
	ldr	r2, [r3, #72]
	cmp	r2, #0
	moveq	r2, #2
	bxne	lr
.L123:
	mov	ip, #1
	ldr	r0, .L133+4
	push	{r4, lr}
	ldr	r1, [r0, #4]
	ldr	r4, [r0, #16]
	rsb	r2, r2, r2, lsl #3
	ldr	lr, [r0]
	lsl	r2, r2, #2
	add	r1, r1, r4
	add	r0, r3, r2
	sub	r1, r1, #1
	str	lr, [r3, r2]
	str	r1, [r0, #4]
	str	ip, [r0, #16]
	pop	{r4, lr}
	bx	lr
.L125:
	mov	r2, #1
	b	.L123
.L134:
	.align	2
.L133:
	.word	bullets
	.word	player
	.size	fireBullet, .-fireBullet
	.comm	vOffBG3,4,4
	.comm	hOffBG3,4,4
	.comm	vOffBG0,4,4
	.comm	hOffBG0,4,4
	.comm	score,4,4
	.comm	hasLost,4,4
	.comm	ghostMode,4,4
	.comm	bullets,84,4
	.comm	obs,360,4
	.comm	police,144,4
	.comm	player,48,4
	.ident	"GCC: (devkitARM release 50) 8.2.0"
