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
	mov	r4, #67108864
	mov	r6, #256
	ldr	r3, .L4
	strh	r6, [r4]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r5, .L4+4
	mov	r3, r6
	strh	r6, [r4]	@ movhi
	mov	r2, #83886080
	ldr	r1, .L4+8
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #1696
	mov	r2, #100663296
	ldr	r1, .L4+12
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r3, #4096
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	r0, #3
	mov	lr, pc
	bx	r5
	mov	r1, #8064
	mov	r2, #0
	ldr	r3, .L4+24
	strh	r1, [r4, #8]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	waitForVBlank
	.word	DMANow
	.word	welcomePal
	.word	welcomeTiles
	.word	100726784
	.word	welcomeMap
	.word	state
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
	push	{r4, lr}
	ldr	r3, .L8
	mov	lr, pc
	bx	r3
	ldr	r4, .L8+4
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L8+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	b	goToMenu
.L9:
	.align	2
.L8:
	.word	hideSprites
	.word	DMANow
	.word	shadowOAM
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
	ldr	r3, .L12
	mov	lr, pc
	bx	r3
	mov	r5, #67108864
	mov	r3, #256
	ldr	r4, .L12+4
	strh	r3, [r5]	@ movhi
	mov	r2, #83886080
	ldr	r1, .L12+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1312
	mov	r2, #100663296
	ldr	r1, .L12+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	ldr	r2, .L12+16
	ldr	r1, .L12+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	ip, #8064
	mov	r0, #1
	mov	r2, #0
	ldr	r1, .L12+24
	ldr	r3, .L12+28
	strh	ip, [r5, #8]	@ movhi
	str	r0, [r1]
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L13:
	.align	2
.L12:
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
	ldr	r3, .L21
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L21+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L14
	ldr	r3, .L21+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L20
.L14:
	pop	{r4, lr}
	bx	lr
.L20:
	pop	{r4, lr}
	b	goToStart
.L22:
	.align	2
.L21:
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
	mov	r2, #4352
	mov	r5, #67108864
	ldr	r3, .L25
	strh	r2, [r5]	@ movhi
	mov	lr, pc
	bx	r3
	ldr	r4, .L25+4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L25+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L25+12
	mov	r2, #100663296
	ldr	r1, .L25+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	ldr	r2, .L25+20
	ldr	r1, .L25+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #7808
	mov	r3, #256
	strh	r2, [r5, #8]	@ movhi
	ldr	r1, .L25+28
	ldr	r2, .L25+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	ldr	r2, .L25+36
	ldr	r1, .L25+40
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L25+44
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L26:
	.align	2
.L25:
	.word	waitForVBlank
	.word	DMANow
	.word	gameBG1Pal
	.word	45024
	.word	gameBG1Tiles
	.word	100724736
	.word	gameBG1Map
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
	ldr	r4, .L34
	ldr	r3, [r4]
	ldr	r2, .L34+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L34+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L27
	ldr	r3, .L34+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L33
.L27:
	pop	{r4, lr}
	bx	lr
.L33:
	ldr	r0, [r4]
	ldr	r3, .L34+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L34+20
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame
.L35:
	.align	2
.L34:
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
	ldr	r3, .L38
	mov	lr, pc
	bx	r3
	mov	r5, #67108864
	mov	r3, #256
	ldr	r4, .L38+4
	strh	r3, [r5]	@ movhi
	mov	r2, #83886080
	ldr	r1, .L38+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #832
	mov	r2, #100663296
	ldr	r1, .L38+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	ldr	r2, .L38+16
	ldr	r1, .L38+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #7808
	mov	r2, #3
	ldr	r3, .L38+24
	strh	r1, [r5, #8]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L39:
	.align	2
.L38:
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
	ldr	r3, .L52
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L52+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L41
	ldr	r2, .L52+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L50
.L41:
	tst	r3, #4
	beq	.L40
	ldr	r3, .L52+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L51
.L40:
	pop	{r4, lr}
	bx	lr
.L50:
	pop	{r4, lr}
	b	goToGame
.L51:
	pop	{r4, lr}
	b	goToMenu
.L53:
	.align	2
.L52:
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
	ldr	r3, .L56
	mov	lr, pc
	bx	r3
	mov	r5, #67108864
	mov	r3, #256
	ldr	r4, .L56+4
	strh	r3, [r5]	@ movhi
	mov	r2, #83886080
	ldr	r1, .L56+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #704
	mov	r2, #100663296
	ldr	r1, .L56+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #4096
	ldr	r2, .L56+16
	ldr	r1, .L56+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #7808
	mov	r2, #4
	ldr	r3, .L56+24
	strh	r1, [r5, #8]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L57:
	.align	2
.L56:
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
	ldr	r3, .L67
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L67+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L59
	ldr	r3, .L67+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L65
.L59:
	ldr	r3, .L67+12
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L66
	pop	{r4, lr}
	bx	lr
.L66:
	pop	{r4, lr}
	b	goToLose
.L65:
	bl	goToPause
	b	.L59
.L68:
	.align	2
.L67:
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
	ldr	r3, .L76
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L76+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L69
	ldr	r3, .L76+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L75
.L69:
	pop	{r4, lr}
	bx	lr
.L75:
	pop	{r4, lr}
	b	goToMenu
.L77:
	.align	2
.L76:
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
	ldr	r3, .L90
	mov	lr, pc
	bx	r3
	ldr	r6, .L90+4
	ldr	r7, .L90+8
	ldr	r5, .L90+12
	ldr	fp, .L90+16
	ldr	r10, .L90+20
	ldr	r9, .L90+24
	ldr	r8, .L90+28
	ldr	r4, .L90+32
.L79:
	ldr	r2, [r6]
	ldrh	r3, [r7]
.L80:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [r7]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L80
.L82:
	.word	.L86
	.word	.L85
	.word	.L84
	.word	.L83
	.word	.L81
.L81:
	ldr	r3, .L90+36
	mov	lr, pc
	bx	r3
	b	.L79
.L83:
	mov	lr, pc
	bx	r8
	b	.L79
.L84:
	mov	lr, pc
	bx	r9
	b	.L79
.L85:
	mov	lr, pc
	bx	r10
	b	.L79
.L86:
	mov	lr, pc
	bx	fp
	b	.L79
.L91:
	.align	2
.L90:
	.word	initialize
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
