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
	mov	ip, #32
	ldr	r3, .L19
	push	{r4, lr}
	smull	lr, r4, r1, r3
	sub	r3, r4, r1, asr #31
	add	r3, r3, r3, lsl #1
	mov	r2, #16
	cmp	r1, r3
	moveq	r3, #88
	movne	r3, #91
	str	ip, [r0, #12]
	mov	ip, #1
	str	r2, [r0, #16]
	ldr	r2, .L19+4
	str	r3, [r0]
	ldr	lr, [r2, #16]
	ldr	r3, [r2, #4]
	sub	r3, r3, lr, lsl ip
	str	r1, [r0, #20]
	sub	r3, r3, #16
	add	r1, r1, r1, lsl ip
	add	r1, r3, r1
	stmib	r0, {r1, ip}
	pop	{r4, lr}
	bx	lr
.L20:
	.align	2
.L19:
	.word	1431655766
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
	b	.L21
.L24:
	.word	.L27
	.word	.L26
	.word	.L25
	.word	.L23
.L23:
	mov	lr, #8
	mov	ip, #24
	mvn	r1, #0
	mov	r2, #80
.L29:
	mov	r3, #240
	str	lr, [r0, #32]
	str	ip, [r0, #28]
	str	r1, [r0, #24]
	str	r2, [r0, #16]
	str	r3, [r0, #20]
.L21:
	ldr	lr, [sp], #4
	bx	lr
.L25:
	mov	lr, #8
	mov	ip, #16
	mvn	r1, #0
	mov	r2, #88
	b	.L29
.L26:
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
.L27:
	mov	lr, #32
	mov	ip, #8
	mvn	r1, #0
	mov	r2, #96
	b	.L29
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
	mov	r1, #32
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r2, #1
	mov	r0, #16
	mov	r9, #80
	mov	r8, #90
	mov	r4, r1
	mov	r3, #0
	mov	lr, #91
	mov	ip, #88
	ldr	r5, .L40
	mov	r7, r2
	mov	r6, r0
	str	r2, [r5, #12]
	str	r2, [r5, #8]
	str	r0, [r5, #20]
	str	r9, [r5]
	str	r8, [r5, #4]
	str	r1, [r5, #16]
	ldr	r2, .L40+4
	ldr	r0, .L40+8
.L33:
	add	r3, r3, #1
	umull	r8, r1, r0, r3
	lsr	r1, r1, #1
	add	r1, r1, r1, lsl #1
	cmp	r3, r1
	movne	r8, lr
	moveq	r8, ip
	add	r1, r3, r3, lsl #1
	add	r1, r1, #10
	cmp	r3, #3
	str	r3, [r2, #20]
	str	r4, [r2, #12]
	str	r6, [r2, #16]
	str	r7, [r2, #8]
	str	r8, [r2]
	str	r1, [r2, #4]
	add	r2, r2, #48
	bne	.L33
	mov	r2, #0
	ldr	r4, .L40+12
.L34:
	add	r6, r2, #1
	mov	r0, r4
	and	r2, r2, #3
	mov	r1, r6
	bl	initObstacle
	cmp	r6, #6
	mov	r2, r6
	add	r4, r4, #60
	bne	.L34
	mov	r2, #0
	mov	r1, #8
	mov	r0, r2
	ldr	ip, [r5, #4]
	ldr	r4, [r5, #16]
	ldr	lr, [r5]
	ldr	r3, .L40+16
	add	ip, ip, r4
.L35:
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
	bne	.L35
	ldr	r2, .L40+20
	ldr	r3, .L40+24
	str	r0, [r2]
	str	r0, [r3]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	player
	.word	police
	.word	-1431655765
	.word	obs
	.word	bullets
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
	ldr	r3, .L46
	ldr	r0, [r3, #4]
	ldr	r4, [r3, #16]
	ldr	ip, [r3]
	ldr	r3, .L46+4
	add	r0, r0, r4
.L43:
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
	bne	.L43
	pop	{r4, lr}
	bx	lr
.L47:
	.align	2
.L46:
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
	ldr	r3, .L64
	ldrh	r2, [r3, #48]
	tst	r2, #64
	str	lr, [sp, #-4]!
	bne	.L51
	mov	r2, #64
	mov	r1, r2
	ldr	r3, .L64+4
	ldr	r0, .L64+8
	str	r2, [r3]
.L52:
	ldr	r2, .L64+12
	ldrh	r2, [r2]
	tst	r2, #1
	ldr	r3, [r3, #4]
	beq	.L54
	ldr	r2, .L64+16
	ldrh	r2, [r2]
	tst	r2, #1
	bne	.L54
	ldr	r2, .L64+20
	ldr	ip, [r2, #16]
	cmp	ip, #0
	beq	.L55
	ldr	ip, [r2, #44]
	cmp	ip, #0
	beq	.L56
	ldr	ip, [r2, #72]
	cmp	ip, #0
	moveq	ip, #2
	beq	.L55
.L54:
	mvn	r3, r3, lsl #17
	mov	r1, #0
	mvn	r3, r3, lsr #17
	ldr	r2, .L64+24
	ldr	lr, [sp], #4
	strh	r3, [r2, #2]	@ movhi
	strh	r0, [r2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	bx	lr
.L51:
	ldrh	r3, [r3, #48]
	tst	r3, #128
	moveq	r2, #88
	movne	r2, #80
	ldreq	r3, .L64+4
	ldrne	r3, .L64+4
	moveq	r1, r2
	streq	r2, [r3]
	ldreq	r0, .L64+28
	movne	r1, r2
	ldrne	r0, .L64+32
	strne	r2, [r3]
	b	.L52
.L56:
	mov	ip, #1
.L55:
	mov	lr, #1
	rsb	ip, ip, ip, lsl #3
	lsl	ip, ip, #2
	str	r1, [r2, ip]
	add	r2, r2, ip
	str	r3, [r2, #4]
	str	lr, [r2, #16]
	b	.L54
.L65:
	.align	2
.L64:
	.word	67109120
	.word	player
	.word	16448
	.word	oldButtons
	.word	buttons
	.word	bullets
	.word	shadowOAM
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
	ble	.L68
	ldr	r1, [r0, #36]
	cmp	r1, #0
	beq	.L68
	push	{r4, r5, r6, r7, r8, lr}
	mov	r4, r0
	mov	r8, #0
	ldr	r5, .L94
	ldr	ip, [r0, #16]
	ldr	lr, [r0, #28]
	ldr	r7, .L94+4
	sub	sp, sp, #16
	add	r6, r5, #84
.L71:
	ldr	r1, [r5, #16]
	cmp	r1, #0
	bne	.L93
.L69:
	add	r5, r5, #28
	cmp	r5, r6
	bne	.L71
	stmib	sp, {r3, lr}
	str	r2, [sp, #12]
	str	ip, [sp]
	ldr	r0, .L94+8
	ldr	r2, [r0, #20]
	ldr	r3, [r0, #16]
	ldm	r0, {r0, r1}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	movne	r2, #1
	ldrne	r3, .L94+12
	strne	r2, [r3]
	add	r2, r4, #20
	ldmia	r2, {r2, r3}
	add	r3, r2, r3
	ldr	r2, [r4, #4]
	str	r3, [r4, #20]
	cmp	r2, #3
	ldrls	pc, [pc, r2, asl #2]
	b	.L66
.L75:
	.word	.L78
	.word	.L77
	.word	.L76
	.word	.L74
.L74:
	ldrb	r2, [r4, #16]	@ zero_extendqisi2
	mvn	r2, r2, lsl #17
	mov	lr, #42
	mvn	r2, r2, lsr #17
	ldr	r1, [r4]
	ldr	ip, .L94+16
	lsl	r3, r3, #23
	lsl	r1, r1, #3
	lsr	r3, r3, #23
	add	r0, ip, r1
	orr	r3, r3, #16384
	strh	r2, [ip, r1]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	strh	lr, [r0, #4]	@ movhi
.L66:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L68:
	mov	r1, #512
	ldr	r3, [r0]
	ldr	r2, .L94+16
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L93:
	str	r2, [sp, #12]
	stmib	sp, {r3, lr}
	str	ip, [sp]
	ldm	r5, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L70
	ldr	ip, [r4, #16]
	ldr	r3, [r4, #20]
	ldr	lr, [r4, #28]
	ldr	r2, [r4, #32]
	b	.L69
.L70:
	str	r8, [r5, #16]
	ldr	r3, [r4, #8]
	sub	r3, r3, #1
	cmp	r3, #0
	str	r3, [r4, #8]
	ldr	ip, [r4, #16]
	ldr	r3, [r4, #20]
	ldr	lr, [r4, #28]
	ldr	r2, [r4, #32]
	strle	r8, [r4, #36]
	b	.L69
.L76:
	ldrb	r2, [r4, #16]	@ zero_extendqisi2
	mvn	r2, r2, lsl #17
	mov	lr, #41
	mvn	r2, r2, lsr #17
	ldr	r1, [r4]
	ldr	ip, .L94+16
	lsl	r1, r1, #3
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
.L77:
	mov	ip, #7
	ldr	r2, [r4]
	ldr	r0, .L94+16
	ldrb	lr, [r4, #16]	@ zero_extendqisi2
	lsl	r2, r2, #3
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
.L78:
	mov	lr, #9
	ldr	r2, [r4]
	ldrb	r1, [r4, #16]	@ zero_extendqisi2
	ldr	ip, .L94+16
	lsl	r3, r3, #23
	lsl	r2, r2, #3
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
.L95:
	.align	2
.L94:
	.word	bullets
	.word	collision
	.word	player
	.word	hasLost
	.word	shadowOAM
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
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L108
	bl	updatePlayer
	mov	lr, pc
	bx	r4
	ldr	r3, .L108+4
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	cmp	r0, r3, lsl #2
	beq	.L107
.L98:
	ldr	r0, .L108+8
	bl	updateObstacles
	ldr	r0, .L108+12
	bl	updateObstacles
	ldr	r0, .L108+16
	bl	updateObstacles
	ldr	r0, .L108+20
	bl	updateObstacles
	ldr	r0, .L108+24
	bl	updateObstacles
	ldr	r0, .L108+28
	bl	updateObstacles
	mov	r7, #512
	ldr	r4, .L108+32
	ldr	r5, .L108+36
	add	r6, r4, #84
.L102:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L100
	mov	r0, r4
	bl	updateBullets.part.2
.L101:
	add	r4, r4, #28
	cmp	r4, r6
	bne	.L102
	mov	r6, #96
	ldr	r2, .L108+40
	ldr	r4, .L108+44
	ldr	lr, .L108+48
	add	ip, r2, #144
.L103:
	ldr	r3, [r2, #20]
	ldr	r1, [r2, #4]
	ldrb	r0, [r2]	@ zero_extendqisi2
	add	r3, r3, #60
	lsl	r3, r3, #3
	and	r1, r1, r4
	add	r2, r2, #48
	add	r7, r5, r3
	orr	r0, r0, #16384
	orr	r1, r1, lr
	cmp	ip, r2
	strh	r0, [r5, r3]	@ movhi
	strh	r6, [r7, #4]	@ movhi
	strh	r1, [r7, #2]	@ movhi
	bne	.L103
	ldr	r3, .L108+52
	mov	lr, pc
	bx	r3
	ldr	r4, .L108+56
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L108+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L108+60
	ldr	r3, [r2]
	add	r3, r3, #1
	str	r3, [r2]
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L100:
	ldr	r3, [r4, #24]
	add	r3, r3, #50
	lsl	r3, r3, #3
	strh	r7, [r5, r3]	@ movhi
	b	.L101
.L107:
	mov	lr, pc
	bx	r4
	ldr	r3, .L108+64
	smull	r2, r1, r0, r3
	sub	r3, r1, r0, asr #31
	add	r3, r3, r3, lsl #1
	sub	r3, r0, r3, lsl #1
	rsb	r3, r3, r3, lsl #4
	ldr	r2, .L108+8
	lsl	r3, r3, #2
	add	r4, r2, r3
	ldr	r1, [r4, #36]
	cmp	r1, #0
	bne	.L98
	ldr	r1, [r2, r3]
	mov	r0, r4
	ldr	r2, [r4, #4]
	bl	initObstacle
	mov	r3, #1
	str	r3, [r4, #36]
	b	.L98
.L109:
	.align	2
.L108:
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
.L111:
	mov	r1, #512
	ldr	r3, [r0, #24]
	ldr	r2, .L112
	add	r3, r3, #50
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L113:
	.align	2
.L112:
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
	lsl	r3, r3, #23
	lsr	r3, r3, #23
	mvn	r3, r3, lsl #17
	str	lr, [sp, #-4]!
	mvn	r3, r3, lsr #17
	mov	lr, #96
	ldr	r2, [r0, #20]
	ldrb	r1, [r0]	@ zero_extendqisi2
	ldr	ip, .L116
	add	r2, r2, #60
	lsl	r2, r2, #3
	add	r0, ip, r2
	orr	r1, r1, #16384
	strh	r1, [ip, r2]	@ movhi
	strh	lr, [r0, #4]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L117:
	.align	2
.L116:
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
	ldr	r3, .L129
	ldr	r2, [r3, #16]
	cmp	r2, #0
	beq	.L119
	ldr	r2, [r3, #44]
	cmp	r2, #0
	beq	.L121
	ldr	r2, [r3, #72]
	cmp	r2, #0
	moveq	r2, #2
	bxne	lr
.L119:
	mov	r0, #1
	ldr	r1, .L129+4
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
.L121:
	mov	r2, #1
	b	.L119
.L130:
	.align	2
.L129:
	.word	bullets
	.word	player
	.size	fireBullet, .-fireBullet
	.comm	score,4,4
	.comm	hasLost,4,4
	.comm	bullets,84,4
	.comm	obs,360,4
	.comm	police,144,4
	.comm	player,48,4
	.ident	"GCC: (devkitARM release 50) 8.2.0"
