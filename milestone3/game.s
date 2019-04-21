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
	mov	r2, #0
	push	{r4, r5, lr}
	mov	r1, #32
	mov	r5, #72
	mov	r4, #1
	mov	lr, #16
	mov	ip, #56
	mov	r0, #108
	ldr	r3, .L13
	str	r2, [r3, #8]
	ldr	r2, .L13+4
	stm	r3, {r1, r5}
	str	r4, [r3, #12]
	str	lr, [r3, #20]
	str	ip, [r3, #16]
	str	r1, [r2]
	str	r0, [r2, #4]
	pop	{r4, r5, lr}
	bx	lr
.L14:
	.align	2
.L13:
	.word	player
	.word	uzi
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
	push	{r4, lr}
	mov	ip, #88
	mov	r4, #56
	mov	lr, #16
	mov	r2, #1
	ldr	r3, .L17
	ldr	r3, [r3, #4]
	sub	r3, r3, #96
	str	r4, [r0, #12]
	str	lr, [r0, #16]
	str	r1, [r0, #20]
	str	ip, [r0]
	str	r3, [r0, #4]
	str	r2, [r0, #8]
	pop	{r4, lr}
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
	push	{r4, lr}
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
	mvn	r1, #1
	mov	r2, #80
.L29:
	mov	r3, #240
	str	lr, [r0, #32]
	str	ip, [r0, #28]
	str	r1, [r0, #24]
	str	r2, [r0, #16]
	str	r3, [r0, #20]
.L19:
	pop	{r4, lr}
	bx	lr
.L23:
	mov	lr, #8
	mov	ip, #16
	mvn	r1, #1
	mov	r2, #88
	b	.L29
.L24:
	mvn	r2, #2
	mov	r3, #8
	str	r2, [r0, #24]
	str	r3, [r0, #32]
	str	r3, [r0, #28]
	ldr	r3, .L30
	mov	r4, r0
	mov	lr, pc
	bx	r3
	tst	r0, #1
	moveq	r2, #78
	movne	r2, #64
	mov	r3, #240
	str	r2, [r4, #16]
	str	r3, [r4, #20]
	pop	{r4, lr}
	bx	lr
.L25:
	mov	lr, #16
	mov	ip, #8
	mvn	r1, #1
	mov	r2, #96
	b	.L29
.L31:
	.align	2
.L30:
	.word	rand
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
	mov	r2, #0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	mov	r6, #56
	ldr	r4, .L40
	str	r2, [r4]
	ldr	r4, .L40+4
	mov	r9, #32
	str	r2, [r4]
	mov	r10, #108
	ldr	r4, .L40+8
	mov	ip, r6
	str	r6, [r4, #16]
	mov	r6, #9984
	mov	r8, #1
	mov	r7, #16
	mov	r3, r2
	str	r2, [r4, #8]
	ldr	r2, .L40+12
	stm	r2, {r9, r10}
	ldr	r2, .L40+16
	mov	fp, #72
	str	r6, [r2]
	mov	r6, #12288
	mov	r5, r8
	mov	lr, r7
	mov	r0, #88
	mvn	r1, #23
	ldr	r2, .L40+20
	str	fp, [r4, #4]
	str	r6, [r2]
	str	r9, [r4]
	str	r8, [r4, #12]
	str	r7, [r4, #20]
	ldr	r2, .L40+24
.L33:
	add	r3, r3, #1
	cmp	r3, #3
	str	r3, [r2, #20]
	str	ip, [r2, #12]
	str	lr, [r2, #16]
	stm	r2, {r0, r1, r5}
	add	r2, r2, #48
	bne	.L33
	mov	r2, #0
	ldr	r5, .L40+28
.L34:
	add	r6, r2, #1
	mov	r0, r5
	and	r2, r2, #3
	mov	r1, r6
	bl	initObstacle
	cmp	r6, #10
	mov	r2, r6
	add	r5, r5, #60
	bne	.L34
	mov	r2, #0
	mov	r1, #8
	mov	r0, r2
	ldr	ip, [r4, #4]
	ldr	r5, [r4, #16]
	ldr	lr, [r4]
	ldr	r3, .L40+32
	add	ip, ip, r5
.L35:
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
	bne	.L35
	mov	r1, #1
	mov	r5, #49152
	mvn	r4, #59
	mov	lr, #195
	mov	ip, #132
	ldr	r3, .L40+36
	str	r0, [r3]
	ldr	r3, .L40+40
	ldr	r2, .L40+44
	str	r0, [r3]
	ldr	r3, .L40+48
	str	r0, [r3]
	strh	r1, [r2, #8]	@ movhi
	ldrh	r1, [r2]
	ldr	r3, .L40+52
	orr	r1, r1, #32
	strh	r0, [r3, #10]	@ movhi
	strh	r1, [r2]	@ movhi
	strh	r0, [r3, #14]	@ movhi
	strh	r5, [r3, #8]	@ movhi
	strh	r4, [r3, #12]	@ movhi
	strh	lr, [r3, #10]	@ movhi
	strh	ip, [r3, #14]	@ movhi
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	hOffBG0
	.word	hOffBG3
	.word	player
	.word	uzi
	.word	vOffBG0
	.word	vOffBG3
	.word	police
	.word	obs
	.word	bullets
	.word	time
	.word	hasLost
	.word	67109376
	.word	ghostMode
	.word	67109120
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
	cmp	r2, #20
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
	mov	r4, r0
	bl	initObstacle
	mov	r3, #1
	str	r3, [r4, #36]
	pop	{r4, lr}
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
	ldr	r3, .L74
	ldrh	r2, [r3]
	ldr	r0, .L74+4
	tst	r2, #64
	push	{r4, lr}
	ldr	ip, [r0]
	beq	.L51
	ldr	r3, .L74+8
	ldrh	r3, [r3]
	tst	r3, #64
	bne	.L51
	cmp	ip, #88
	ldreq	r3, [r0, #8]
	subeq	r3, r3, #1000
	streq	r3, [r0, #8]
.L51:
	ldr	r3, [r0, #20]
	rsb	r1, r3, #256
	cmp	r1, ip
	bgt	.L73
.L52:
	mov	r3, #88
	mov	r1, #0
	mov	ip, r3
	str	r3, [r0]
	str	r1, [r0, #8]
.L53:
	tst	r2, #1
	ldr	r1, [r0, #4]
	beq	.L54
	ldr	r3, .L74+8
	ldrh	r3, [r3]
	ands	r3, r3, #1
	bne	.L54
	ldr	r4, .L74+12
	mov	lr, r4
	b	.L56
.L55:
	add	r3, r3, #1
	cmp	r3, #20
	add	lr, lr, #28
	beq	.L54
.L56:
	ldr	r2, [lr, #16]
	cmp	r2, #0
	bne	.L55
	mov	r2, #1
	rsb	r3, r3, r3, lsl #3
	lsl	r3, r3, #2
	str	ip, [r4, r3]
	add	lr, r1, #40
	add	r3, r4, r3
	str	lr, [r3, #4]
	str	r2, [r3, #16]
.L54:
	ldr	r3, .L74+16
	ldrh	r2, [r3, #48]
	tst	r2, #2
	bne	.L57
	mov	r2, #1
	ldr	r4, .L74+20
	ldr	lr, .L74+24
	str	r2, [r4]
	str	r2, [lr]
	ldrh	r2, [r3, #48]
	ands	r2, r2, #1
	bne	.L59
	ldr	r4, .L74+12
	mov	lr, r4
	b	.L61
.L60:
	add	r2, r2, #1
	cmp	r2, #20
	add	lr, lr, #28
	beq	.L59
.L61:
	ldr	r3, [lr, #16]
	cmp	r3, #0
	bne	.L60
	mov	r3, #1
	rsb	r2, r2, r2, lsl #3
	lsl	r2, r2, #2
	str	ip, [r4, r2]
	add	lr, r1, #40
	add	r2, r4, r2
	str	lr, [r2, #4]
	str	r3, [r2, #16]
	b	.L59
.L57:
	mov	r2, #0
	ldr	r4, .L74+20
	ldr	lr, .L74+24
	str	r2, [r4]
	str	r2, [lr]
	ldrh	r3, [r3, #48]
.L59:
	ldr	r3, .L74+28
	and	r2, r1, r3
	mvn	r2, r2, lsl #18
	ldr	lr, .L74+32
	ldr	lr, [lr]
	mvn	r2, r2, lsr #18
	cmp	lr, #5
	movlt	r4, #9664
	movge	r4, #9408
	mov	lr, #4096
	add	r1, r1, #35
	and	r1, r1, r3
	ldr	r3, [r0, #8]
	add	ip, ip, r3, asr #8
	ldr	r3, .L74+36
	orr	r1, r1, #16384
	strh	r2, [r3, #202]	@ movhi
	and	r2, ip, #255
	strh	r1, [r3, #2]	@ movhi
	orr	r1, r2, #16384
	str	ip, [r0]
	strh	r4, [r3, #204]	@ movhi
	strh	lr, [r3, #4]	@ movhi
	strh	r2, [r3]	@ movhi
	strh	r1, [r3, #200]	@ movhi
	pop	{r4, lr}
	bx	lr
.L73:
	ldr	r1, [r0, #8]
	add	r3, r3, ip
	add	r3, r3, r1, asr #8
	cmp	r3, #103
	addle	r1, r1, #40
	strle	r1, [r0, #8]
	ble	.L53
	b	.L52
.L75:
	.align	2
.L74:
	.word	oldButtons
	.word	player
	.word	buttons
	.word	bullets
	.word	67109120
	.word	ghostMode
	.word	infiniteAmmo
	.word	511
	.word	time
	.word	shadowOAM
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	animatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	animatePlayer, %function
animatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	bx	lr
	.size	animatePlayer, .-animatePlayer
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
	ldr	r1, [r0, #32]
	ldr	r2, [r0, #20]
	rsb	r3, r1, #0
	cmp	r2, r3
	movle	r3, #0
	strle	r3, [r0, #36]
	ble	.L79
	ldr	r3, [r0, #36]
	cmp	r3, #0
	beq	.L79
	push	{r4, r5, r6, r7, r8, lr}
	mov	r5, r0
	ldr	r4, .L106
	sub	sp, sp, #16
	mov	r8, #0
	ldr	r0, [r0, #16]
	ldr	ip, [r5, #28]
	ldr	r7, .L106+4
	add	r6, r4, #560
	b	.L82
.L80:
	add	r4, r4, #28
	cmp	r4, r6
	beq	.L104
.L82:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	beq	.L80
	stm	sp, {r0, r2, ip}
	str	r1, [sp, #12]
	ldm	r4, {r0, r1, r2, r3}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	bne	.L81
	add	r4, r4, #28
	add	r0, r5, #16
	cmp	r4, r6
	ldm	r0, {r0, r2}
	ldr	ip, [r5, #28]
	ldr	r1, [r5, #32]
	bne	.L82
.L104:
	stm	sp, {r0, r2, ip}
	str	r1, [sp, #12]
	ldr	r4, .L106+8
	ldr	r3, [r4, #16]
	ldr	r2, [r4, #20]
	ldm	r4, {r0, r1}
	mov	lr, pc
	bx	r7
	cmp	r0, #0
	beq	.L83
	ldr	r3, .L106+12
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L105
.L83:
	add	r2, r5, #20
	ldmia	r2, {r2, r3}
	add	r3, r2, r3
	ldr	r2, [r5, #4]
	str	r3, [r5, #20]
	cmp	r2, #3
	ldrls	pc, [pc, r2, asl #2]
	b	.L77
.L86:
	.word	.L89
	.word	.L88
	.word	.L87
	.word	.L85
.L81:
	str	r8, [r4, #16]
	ldr	r3, [r5, #8]
	sub	r3, r3, #1
	cmp	r3, #0
	add	r0, r5, #16
	ldm	r0, {r0, r2}
	str	r3, [r5, #8]
	ldr	ip, [r5, #28]
	ldr	r1, [r5, #32]
	strle	r8, [r5, #36]
	b	.L80
.L79:
	mov	r1, #512
	ldr	r3, [r0]
	ldr	r2, .L106+16
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L85:
	ldrb	r2, [r5, #16]	@ zero_extendqisi2
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, [r5]
	ldr	ip, .L106+16
	lsl	r3, r3, #23
	lsl	r1, r1, #3
	lsr	r3, r3, #23
	ldr	lr, .L106+20
	add	r0, ip, r1
	orr	r3, r3, #16384
	strh	r2, [ip, r1]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	strh	lr, [r0, #4]	@ movhi
.L77:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L87:
	ldrb	r2, [r5, #16]	@ zero_extendqisi2
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	ldr	r1, [r5]
	ldr	ip, .L106+16
	lsl	r1, r1, #3
	ldr	lr, .L106+24
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
.L88:
	ldr	r2, [r5]
	ldr	r0, .L106+16
	ldrb	lr, [r5, #16]	@ zero_extendqisi2
	lsl	r2, r2, #3
	ldr	ip, .L106+28
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
.L89:
	ldr	r2, [r5]
	ldrb	r1, [r5, #16]	@ zero_extendqisi2
	ldr	ip, .L106+16
	lsl	r2, r2, #3
	ldr	lr, .L106+32
	lsl	r3, r3, #23
	add	r0, ip, r2
	lsr	r3, r3, #23
	orr	r1, r1, #16384
	strh	r1, [ip, r2]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	strh	lr, [r0, #4]	@ movhi
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L105:
	ldr	ip, [r4, #4]
	sub	ip, ip, #16
	str	ip, [r4, #4]
	ldr	r2, .L106+36
	ldr	r1, .L106+40
	ldr	r0, .L106+44
	ldr	r4, .L106+48
	mov	lr, pc
	bx	r4
	b	.L83
.L107:
	.align	2
.L106:
	.word	bullets
	.word	collision
	.word	player
	.word	ghostMode
	.word	shadowOAM
	.word	1066
	.word	1065
	.word	1031
	.word	7177
	.word	11025
	.word	9156
	.word	hitSFX
	.word	playSoundA
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
	ldr	lr, .L129
	ldr	r0, [lr]
	ldr	ip, .L129+4
	add	r0, r0, #768
	ldr	r3, [ip]
	asr	r2, r0, #8
	str	r0, [lr]
	lsl	r2, r2, #16
	ldr	r0, .L129+8
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
	ldr	r2, .L129+12
	lsr	r3, r3, #16
	strh	r3, [r1, #28]	@ movhi
	ldr	r3, [r2]
	asr	r3, r3, #8
	lsl	r3, r3, #16
	lsr	r3, r3, #16
	strh	r3, [r1, #30]	@ movhi
	ldr	r4, .L129+16
	bl	updatePlayer
	mov	lr, pc
	bx	r4
	ldr	r3, .L129+20
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #5
	add	r3, r3, r3, lsl #2
	add	r3, r3, r3, lsl #2
	cmp	r0, r3, lsl #2
	beq	.L126
.L110:
	ldr	r4, .L129+24
	add	r5, r4, #600
.L112:
	mov	r0, r4
	add	r4, r4, #60
	bl	updateObstacles
	cmp	r5, r4
	bne	.L112
	ldr	r4, .L129+28
	mov	r7, #512
	ldr	r6, .L129+32
	add	r5, r4, #560
	b	.L115
.L128:
	mov	r0, r4
	add	r4, r4, #28
	bl	updateBullets.part.2
	cmp	r5, r4
	beq	.L127
.L115:
	ldr	r3, [r4, #16]
	cmp	r3, #0
	bne	.L128
	ldr	r3, [r4, #24]
	add	r4, r4, #28
	add	r3, r3, #50
	lsl	r3, r3, #3
	cmp	r5, r4
	strh	r7, [r6, r3]	@ movhi
	bne	.L115
.L127:
	mov	r0, #0
	ldr	r3, .L129+36
	ldr	r9, .L129+40
	ldr	r1, .L129+44
	ldr	r7, [r3, #4]
	ldr	r8, [r9]
	ldr	r5, .L129+48
	ldr	r4, .L129+52
	ldr	lr, .L129+56
	add	ip, r1, #144
.L117:
	ldr	r3, [r1, #4]
	ldr	r2, [r1, #12]
	add	r2, r3, r2
	cmp	r2, r7
	movgt	r0, #1
	and	r3, r3, r5
	orr	r2, r3, r4
	ldr	r3, [r1, #20]
	ldrb	r10, [r1], #48	@ zero_extendqisi2
	add	r3, r3, #60
	lsl	r3, r3, #3
	add	fp, r6, r3
	movgt	r8, r0
	orr	r10, r10, #16384
	cmp	ip, r1
	strh	r10, [r6, r3]	@ movhi
	strh	r2, [fp, #2]	@ movhi
	strh	lr, [fp, #4]	@ movhi
	bne	.L117
	cmp	r0, #0
	ldr	r3, .L129+60
	strne	r8, [r9]
	ldr	r4, .L129+64
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L129+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L126:
	mov	lr, pc
	bx	r4
	ldr	r3, .L129+68
	smull	r1, r2, r3, r0
	asr	r3, r0, #31
	rsb	r3, r3, r2, asr #2
	add	r3, r3, r3, lsl #2
	sub	r3, r0, r3, lsl #1
	rsb	r3, r3, r3, lsl #4
	ldr	r2, .L129+24
	lsl	r3, r3, #2
	add	r4, r2, r3
	ldr	r1, [r4, #36]
	cmp	r1, #0
	bne	.L110
	ldr	r1, [r2, r3]
	mov	r0, r4
	ldr	r2, [r4, #4]
	bl	initObstacle
	mov	r3, #1
	str	r3, [r4, #36]
	b	.L110
.L130:
	.align	2
.L129:
	.word	hOffBG0
	.word	hOffBG3
	.word	vOffBG0
	.word	vOffBG3
	.word	rand
	.word	1374389535
	.word	obs
	.word	bullets
	.word	shadowOAM
	.word	player
	.word	hasLost
	.word	police
	.word	511
	.word	-16384
	.word	9416
	.word	waitForVBlank
	.word	DMANow
	.word	1717986919
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
.L132:
	mov	r1, #512
	ldr	r3, [r0, #24]
	ldr	r2, .L133
	add	r3, r3, #50
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L134:
	.align	2
.L133:
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
	mvn	r3, r3, lsl #18
	ldr	r1, .L138
	ldr	r1, [r1, #4]
	cmp	r2, r1
	movgt	r1, #1
	mvn	r3, r3, lsr #18
	ldrgt	r2, .L138+4
	str	lr, [sp, #-4]!
	strgt	r1, [r2]
	ldr	r2, [r0, #20]
	ldrb	r1, [r0]	@ zero_extendqisi2
	ldr	ip, .L138+8
	add	r2, r2, #60
	lsl	r2, r2, #3
	ldr	lr, .L138+12
	add	r0, ip, r2
	orr	r1, r1, #16384
	strh	r1, [ip, r2]	@ movhi
	strh	lr, [r0, #4]	@ movhi
	strh	r3, [r0, #2]	@ movhi
	ldr	lr, [sp], #4
	bx	lr
.L139:
	.align	2
.L138:
	.word	player
	.word	hasLost
	.word	shadowOAM
	.word	9416
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
	ldr	r0, .L150
	mov	r3, #0
	mov	r2, r0
	b	.L143
.L141:
	add	r3, r3, #1
	cmp	r3, #20
	add	r2, r2, #28
	bxeq	lr
.L143:
	ldr	r1, [r2, #16]
	cmp	r1, #0
	bne	.L141
	mov	ip, #1
	ldr	r1, .L150+4
	rsb	r3, r3, r3, lsl #3
	ldr	r2, [r1, #4]
	str	lr, [sp, #-4]!
	lsl	r3, r3, #2
	ldr	lr, [r1]
	add	r2, r2, #40
	add	r1, r0, r3
	str	lr, [r0, r3]
	str	r2, [r1, #4]
	str	ip, [r1, #16]
	ldr	lr, [sp], #4
	bx	lr
.L151:
	.align	2
.L150:
	.word	bullets
	.word	player
	.size	fireBullet, .-fireBullet
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
	mov	lr, #49152
	mvn	ip, #59
	mov	r0, #195
	mov	r1, #132
	ldr	r3, .L154
	strh	r2, [r3, #10]	@ movhi
	strh	r2, [r3, #14]	@ movhi
	strh	lr, [r3, #8]	@ movhi
	strh	ip, [r3, #12]	@ movhi
	ldr	lr, [sp], #4
	strh	r0, [r3, #10]	@ movhi
	strh	r1, [r3, #14]	@ movhi
	bx	lr
.L155:
	.align	2
.L154:
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
	mov	r5, #49152
	mvn	r4, #59
	mov	lr, #195
	mov	ip, #132
	ldr	r2, .L158
	strh	r1, [r2, #8]	@ movhi
	ldrh	r1, [r2]
	ldr	r3, .L158+4
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
.L159:
	.align	2
.L158:
	.word	67109376
	.word	67109120
	.size	setupTimeInterrupts, .-setupTimeInterrupts
	.comm	vOffBG3,4,4
	.comm	hOffBG3,4,4
	.comm	vOffBG0,4,4
	.comm	hOffBG0,4,4
	.comm	time,4,4
	.comm	hasLost,4,4
	.comm	infiniteAmmo,4,4
	.comm	ghostMode,4,4
	.comm	bullets,560,4
	.comm	obs,600,4
	.comm	police,144,4
	.comm	uzi,40,4
	.comm	player,48,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 50) 8.2.0"
