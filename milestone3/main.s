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
	.file	"main.c"
	.text
	.align	2
	.global	goToMenu
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToMenu, %function
goToMenu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r6, #67108864
	mov	r5, #512
	ldr	r4, .L4
	mov	r3, #256
	strh	r5, [r6]	@ movhi
	mov	r2, #83886080
	ldr	r1, .L4+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1696
	mov	r2, #100663296
	ldr	r1, .L4+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r0, #3
	mov	r3, #4096
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	lr, pc
	bx	r4
	mov	r3, #8064
	mov	r1, #0
	ldr	r2, .L4+20
	strh	r3, [r6, #10]	@ movhi
	ldr	r3, .L4+24
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, #117440512
	ldr	r1, .L4+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	welcomePal
	.word	welcomeTiles
	.word	100726784
	.word	welcomeMap
	.word	state
	.word	hideSprites
	.word	shadowOAM
	.size	goToMenu, .-goToMenu
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	goToMenu
	.size	initialize, .-initialize
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L9
	mov	lr, pc
	bx	r3
	mov	r5, #67108864
	mov	r2, #512
	ldr	r4, .L9+4
	strh	r2, [r5]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L9+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1312
	mov	r2, #100663296
	ldr	r1, .L9+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	ldr	r2, .L9+16
	ldr	r1, .L9+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	ip, #8064
	mov	r0, #1
	mov	r2, #0
	ldr	r1, .L9+24
	ldr	r3, .L9+28
	strh	ip, [r5, #10]	@ movhi
	str	r0, [r1]
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L10:
	.align	2
.L9:
	.word	waitForVBlank
	.word	DMANow
	.word	instructionsPal
	.word	instructionsTiles
	.word	100726784
	.word	instructionsMap
	.word	state
	.word	seed
	.size	goToStart, .-goToStart
	.align	2
	.global	menu
	.syntax unified
	.arm
	.fpu softvfp
	.type	menu, %function
menu:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L18
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L18+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L11
	ldr	r3, .L18+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L17
.L11:
	pop	{r4, lr}
	bx	lr
.L17:
	pop	{r4, lr}
	b	goToStart
.L19:
	.align	2
.L18:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	menu, .-menu
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #6400
	mov	r5, #67108864
	ldr	r4, .L22
	strh	r2, [r5]	@ movhi
	mov	r3, #4608
	mov	r2, #100663296
	ldr	r1, .L22+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L22+8
	ldr	r1, .L22+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L22+16
	mov	r3, #256
	strh	r2, [r5, #8]	@ movhi
	ldr	r1, .L22+20
	mov	r2, #83886080
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #5440
	ldr	r2, .L22+24
	ldr	r1, .L22+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L22+32
	ldr	r1, .L22+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L22+40
	mov	r3, #256
	strh	r2, [r5, #14]	@ movhi
	ldr	r1, .L22+44
	ldr	r2, .L22+48
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	ldr	r2, .L22+52
	ldr	r1, .L22+56
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L22+60
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L23:
	.align	2
.L22:
	.word	DMANow
	.word	gameBG1Tiles
	.word	100673536
	.word	gameBG1Map
	.word	17792
	.word	gameBG3Pal
	.word	100712448
	.word	gameBG3Tiles
	.word	100679680
	.word	gameBG3Map
	.word	18575
	.word	spritesheetPal
	.word	83886592
	.word	100728832
	.word	spritesheetTiles
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L31
	ldr	r3, [r4]
	ldr	r2, .L31+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L31+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L24
	ldr	r3, .L31+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L30
.L24:
	pop	{r4, lr}
	bx	lr
.L30:
	ldr	r0, [r4]
	ldr	r3, .L31+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L31+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame
.L32:
	.align	2
.L31:
	.word	seed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	initGame
	.size	start, .-start
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L35
	mov	lr, pc
	bx	r3
	mov	r5, #67108864
	mov	r2, #512
	ldr	r4, .L35+4
	strh	r2, [r5]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L35+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #832
	mov	r2, #100663296
	ldr	r1, .L35+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	ldr	r2, .L35+16
	ldr	r1, .L35+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #7808
	mov	r2, #3
	ldr	r3, .L35+24
	strh	r1, [r5, #10]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L36:
	.align	2
.L35:
	.word	waitForVBlank
	.word	DMANow
	.word	pausePal
	.word	pauseTiles
	.word	100724736
	.word	pauseMap
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L49
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L49+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L38
	ldr	r2, .L49+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L47
.L38:
	tst	r3, #4
	beq	.L37
	ldr	r3, .L49+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L48
.L37:
	pop	{r4, lr}
	bx	lr
.L47:
	pop	{r4, lr}
	b	goToGame
.L48:
	pop	{r4, lr}
	b	goToMenu
.L50:
	.align	2
.L49:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	ldr	r3, .L53
	mov	lr, pc
	bx	r3
	mov	r5, #67108864
	mov	r2, #512
	ldr	r4, .L53+4
	strh	r2, [r5]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L53+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #704
	mov	r2, #100663296
	ldr	r1, .L53+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	ldr	r2, .L53+16
	ldr	r1, .L53+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #7808
	mov	r2, #4
	ldr	r3, .L53+24
	strh	r1, [r5, #10]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L54:
	.align	2
.L53:
	.word	waitForVBlank
	.word	DMANow
	.word	losePal
	.word	loseTiles
	.word	100724736
	.word	loseMap
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L64
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L64+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L56
	ldr	r3, .L64+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L62
.L56:
	ldr	r3, .L64+12
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L63
	pop	{r4, lr}
	bx	lr
.L63:
	pop	{r4, lr}
	b	goToLose
.L62:
	bl	goToPause
	b	.L56
.L65:
	.align	2
.L64:
	.word	updateGame
	.word	oldButtons
	.word	buttons
	.word	hasLost
	.size	game, .-game
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L73
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L73+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L66
	ldr	r3, .L73+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L72
.L66:
	pop	{r4, lr}
	bx	lr
.L72:
	pop	{r4, lr}
	b	goToMenu
.L74:
	.align	2
.L73:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r7, fp, lr}
	ldr	r3, .L87
	mov	lr, pc
	bx	r3
	ldr	r6, .L87+4
	ldr	r7, .L87+8
	ldr	r5, .L87+12
	ldr	fp, .L87+16
	ldr	r10, .L87+20
	ldr	r9, .L87+24
	ldr	r8, .L87+28
	ldr	r4, .L87+32
.L76:
	ldr	r2, [r6]
	ldrh	r3, [r7]
.L77:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L77
.L79:
	.word	.L83
	.word	.L82
	.word	.L81
	.word	.L80
	.word	.L78
.L78:
	ldr	r3, .L87+36
	mov	lr, pc
	bx	r3
	b	.L76
.L80:
	mov	lr, pc
	bx	r8
	b	.L76
.L81:
	mov	lr, pc
	bx	r9
	b	.L76
.L82:
	mov	lr, pc
	bx	r10
	b	.L76
.L83:
	mov	lr, pc
	bx	fp
	b	.L76
.L88:
	.align	2
.L87:
	.word	goToMenu
	.word	state
	.word	buttons
	.word	oldButtons
	.word	menu
	.word	start
	.word	game
	.word	pause
	.word	67109120
	.word	lose
	.size	main, .-main
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	shadowOAM,1024,4
	.ident	"GCC: (devkitARM release 50) 8.2.0"
