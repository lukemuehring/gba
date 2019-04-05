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
	.type	initObstacles.part.0, %function
initObstacles.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r1, #0
	push	{r4, lr}
	mov	r2, #1
	mov	r4, #3
	mov	r0, #8
	mvn	ip, #0
	ldr	r3, .L4
	ldr	lr, .L4+4
	str	r1, [r3, #4]
	ldr	r1, [r3, #32]
	ldr	lr, [lr]
	rsb	r1, r1, #239
	str	r4, [r3, #8]
	str	lr, [r3, #16]
	str	r1, [r3, #20]
	str	ip, [r3, #24]
	str	r2, [r3]
	str	r2, [r3, #12]
	str	r2, [r3, #36]
	str	r0, [r3, #32]
	str	r0, [r3, #28]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	obs
	.word	player
	.size	initObstacles.part.0, .-initObstacles.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateObstacles.part.1, %function
updateObstacles.part.1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, r0
	mov	r8, #0
	ldr	r4, .L21
	add	ip, r0, #28
	ldr	r2, [r0, #16]
	ldr	r1, [r0, #20]
	ldm	ip, {ip, lr}
	ldr	r7, .L21+4
	sub	sp, sp, #16
	add	r6, r4, #84
.L9:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bne	.L19
.L7:
	add	r4, r4, #28
	cmp	r4, r6
	bne	.L9
	stmib	sp, {r1, ip, lr}
	str	r2, [sp]
	ldr	r0, .L21+8
	ldr	r3, [r0, #24]
	ldr	r2, [r0, #28]
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	movne	r2, #1
	mov	lr, #9
	ldrne	r3, .L21+12
	strne	r2, [r3]
	ldr	r2, [r5]
	add	r1, r5, #20
	ldmia	r1, {r1, r3}
	add	r3, r1, r3
	ldr	ip, .L21+16
	ldr	r1, [r5, #16]
	lsl	r2, r2, #3
	str	r3, [r5, #20]
	add	r0, ip, r2
	orr	r1, r1, #16384
	orr	r3, r3, #16384
	strh	r1, [ip, r2]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	strh	lr, [r0, #4]	@ movhi
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L19:
	stmib	sp, {r1, ip, lr}
	str	r2, [sp]
	ldm	r4, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L20
	str	r8, [r4, #16]
	ldr	r3, [r5, #8]
	sub	r3, r3, #1
	cmp	r3, #0
	add	ip, r5, #28
	ldm	ip, {ip, lr}
	str	r3, [r5, #8]
	ldr	r2, [r5, #16]
	ldr	r1, [r5, #20]
	strle	r8, [r5, #36]
	b	.L7
.L20:
	add	ip, r5, #28
	ldr	r2, [r5, #16]
	ldr	r1, [r5, #20]
	ldm	ip, {ip, lr}
	b	.L7
.L22:
	.align	2
.L21:
	.word	bullets
	.word	collision
	.word	player
	.word	hasLost
	.word	shadowOAM
	.size	updateObstacles.part.1, .-updateObstacles.part.1
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
	push	{r4, r5, r6, lr}
	mov	r0, #96
	mov	r1, #90
	mov	r2, #1
	mov	r3, #16
	mov	r4, #8
	ldr	r5, .L27
	stm	r5, {r0, r1}
	str	r2, [r5, #20]
	str	r3, [r5, #24]
	str	r4, [r5, #28]
	bl	initObstacles.part.0
	mov	r2, #0
	mov	r0, r2
	mov	r1, r4
	ldr	ip, [r5, #4]
	ldr	r4, [r5, #24]
	ldr	lr, [r5]
	ldr	r3, .L27+4
	add	ip, ip, r4
.L24:
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
	bne	.L24
	ldr	r2, .L27+8
	ldr	r3, .L27+12
	str	r0, [r2]
	str	r0, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L28:
	.align	2
.L27:
	.word	player
	.word	bullets
	.word	score
	.word	hasLost
	.size	initGame, .-initGame
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
	mov	ip, #90
	mov	lr, #96
	mov	r0, #1
	mov	r1, #8
	mov	r2, #16
	ldr	r3, .L31
	str	lr, [r3]
	str	ip, [r3, #4]
	str	r0, [r3, #20]
	str	r1, [r3, #28]
	str	r2, [r3, #24]
	ldr	lr, [sp], #4
	bx	lr
.L32:
	.align	2
.L31:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	initObstacles
	.syntax unified
	.arm
	.fpu softvfp
	.type	initObstacles, %function
initObstacles:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	initObstacles.part.0
	.size	initObstacles, .-initObstacles
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
	ldr	r3, .L38
	ldr	r0, [r3, #4]
	ldr	r4, [r3, #24]
	ldr	ip, [r3]
	ldr	r3, .L38+4
	add	r0, r0, r4
.L35:
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
	bne	.L35
	pop	{r4, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	player
	.word	bullets
	.size	initBullets, .-initBullets
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
	ldr	r3, .L54
	ldrh	r2, [r3, #48]
	tst	r2, #64
	str	lr, [sp, #-4]!
	bne	.L41
	mov	r2, #80
	mov	r1, r2
	ldr	r3, .L54+4
	ldr	r0, .L54+8
	str	r2, [r3]
.L42:
	ldr	r2, .L54+12
	ldrh	r2, [r2]
	tst	r2, #1
	ldr	r3, [r3, #4]
	beq	.L44
	ldr	r2, .L54+16
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L44
	ldr	r2, .L54+20
	ldr	ip, [r2, #16]
	cmp	ip, #0
	beq	.L45
	ldr	ip, [r2, #44]
	cmp	ip, #0
	beq	.L46
	ldr	ip, [r2, #72]
	cmp	ip, #0
	moveq	ip, #2
	beq	.L45
.L44:
	mvn	r3, r3, lsl #17
	mov	r1, #0
	mvn	r3, r3, lsr #17
	ldr	r2, .L54+24
	ldr	lr, [sp], #4
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	bx	lr
.L41:
	ldrh	r3, [r3, #48]
	tst	r3, #128
	moveq	r2, #112
	movne	r2, #96
	ldreq	r3, .L54+4
	ldrne	r3, .L54+4
	moveq	r1, r2
	streq	r2, [r3]
	ldreq	r0, .L54+28
	movne	r1, r2
	ldrne	r0, .L54+32
	strne	r2, [r3]
	b	.L42
.L46:
	mov	ip, #1
.L45:
	mov	lr, #1
	rsb	ip, ip, ip, lsl #3
	lsl	ip, ip, #2
	str	r1, [r2, ip]
	add	r2, r2, ip
	str	r3, [r2, #4]
	str	lr, [r2, #16]
	b	.L44
.L55:
	.align	2
.L54:
	.word	67109120
	.word	player
	.word	16464
	.word	oldButtons
	.word	buttons
	.word	bullets
	.word	shadowOAM
	.word	16496
	.word	16480
	.size	updatePlayer, .-updatePlayer
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
	push	{r4, r5, r6, r7, r8, lr}
	bl	updatePlayer
	ldr	r0, .L69
	ldr	r3, [r0, #20]
	cmp	r3, #0
	movle	r3, #0
	strle	r3, [r0, #36]
	ble	.L58
	ldr	r3, [r0, #36]
	cmp	r3, #0
	beq	.L58
	bl	updateObstacles.part.1
.L59:
	mov	lr, #512
	mov	r5, #0
	mov	r4, #6
	ldr	r3, .L69+4
	ldr	ip, .L69+8
	add	r0, r3, #84
.L63:
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L60
	ldr	r1, [r3, #20]
	ldr	r2, [r3, #4]
	add	r2, r2, r1
	cmp	r2, #240
	ldrle	r1, [r3, #24]
	addle	r1, r1, #50
	ldrle	r7, [r3]
	lslle	r1, r1, #3
	addle	r6, ip, r1
	str	r2, [r3, #4]
	strgt	r5, [r3, #16]
	strhle	r7, [ip, r1]	@ movhi
	strhle	r2, [r6, #2]	@ movhi
	strhle	r4, [r6, #4]	@ movhi
.L62:
	add	r3, r3, #28
	cmp	r3, r0
	bne	.L63
	ldr	r3, .L69+12
	mov	lr, pc
	bx	r3
	ldr	r4, .L69+16
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L69+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L60:
	ldr	r2, [r3, #24]
	add	r2, r2, #50
	lsl	r2, r2, #3
	strh	lr, [ip, r2]	@ movhi
	b	.L62
.L58:
	mov	r1, #512
	ldr	r3, [r0]
	ldr	r2, .L69+8
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	b	.L59
.L70:
	.align	2
.L69:
	.word	obs
	.word	bullets
	.word	shadowOAM
	.word	waitForVBlank
	.word	DMANow
	.size	updateGame, .-updateGame
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
	@ link register save eliminated.
	ldr	r2, [r0, #20]
	cmp	r2, #0
	movle	r2, #0
	mov	r3, r0
	strle	r2, [r0, #36]
	ble	.L73
	ldr	r2, [r0, #36]
	cmp	r2, #0
	bne	updateObstacles.part.1
.L73:
	mov	r1, #512
	ldr	r3, [r3]
	ldr	r2, .L77
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L78:
	.align	2
.L77:
	.word	shadowOAM
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
	ldr	r3, [r0, #16]
	cmp	r3, #0
	beq	.L80
	ldr	r3, [r0, #4]
	ldr	r2, [r0, #20]
	add	r3, r3, r2
	cmp	r3, #240
	str	r3, [r0, #4]
	bgt	.L81
	str	lr, [sp, #-4]!
	mov	lr, #6
	ldr	r2, [r0, #24]
	ldr	ip, .L87
	add	r2, r2, #50
	ldr	r0, [r0]
	lsl	r2, r2, #3
	add	r1, ip, r2
	strh	r0, [ip, r2]	@ movhi
	strh	lr, [r1, #4]	@ movhi
	strh	r3, [r1, #2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L81:
	mov	r3, #0
	str	r3, [r0, #16]
	bx	lr
.L80:
	mov	r1, #512
	ldr	r3, [r0, #24]
	ldr	r2, .L87
	add	r3, r3, #50
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L88:
	.align	2
.L87:
	.word	shadowOAM
	.size	updateBullets, .-updateBullets
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
	ldr	r3, .L100
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L90
	ldr	r2, [r3, #44]
	cmp	r2, #0
	beq	.L92
	ldr	r2, [r3, #72]
	cmp	r2, #0
	moveq	r2, #2
	bxne	lr
.L90:
	mov	r0, #1
	ldr	r1, .L100+4
	rsb	r2, r2, r2, lsl #3
	str	lr, [sp, #-4]!
	lsl	r2, r2, #2
	ldr	lr, [r1]
	ldr	ip, [r1, #4]
	add	r1, r3, r2
	str	lr, [r3, r2]
	str	ip, [r1, #4]
	str	r0, [r1, #16]
	ldr	lr, [sp], #4
	bx	lr
.L92:
	mov	r2, #1
	b	.L90
.L101:
	.align	2
.L100:
	.word	bullets
	.word	player
	.size	fireBullet, .-fireBullet
	.comm	score,4,4
	.comm	hasLost,4,4
	.comm	bullets,84,4
	.comm	obs,60,4
	.comm	player,56,4
	.ident	"GCC: (devkitARM release 50) 8.2.0"
