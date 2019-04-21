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
	ldr	r3, .L4+8
	mov	r2, #100663296
	ldr	r1, .L4+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r0, #3
	mov	r3, #1024
	ldr	r2, .L4+16
	ldr	r1, .L4+20
	mov	lr, pc
	bx	r4
	mov	r3, #6528
	mov	r1, #0
	ldr	r2, .L4+24
	strh	r3, [r6, #10]	@ movhi
	ldr	r3, .L4+28
	str	r1, [r2]
	mov	lr, pc
	bx	r3
	mov	r3, r5
	mov	r2, #117440512
	ldr	r1, .L4+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r4, .L4+36
	mov	r3, #1
	ldr	r2, .L4+40
	ldr	r1, .L4+44
	ldr	r0, .L4+48
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	welcomePal
	.word	16224
	.word	welcomeTiles
	.word	100714496
	.word	welcomeMap
	.word	state
	.word	hideSprites
	.word	shadowOAM
	.word	playSoundB
	.word	11025
	.word	724937
	.word	MenuSong
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
	ldr	r3, .L8+4
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToMenu
.L9:
	.align	2
.L8:
	.word	setupSounds
	.word	setupSoundInterrupts
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
	mov	r2, #512
	ldr	r4, .L12+4
	strh	r2, [r5]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L12+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2624
	mov	r2, #100663296
	ldr	r1, .L12+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L12+16
	ldr	r1, .L12+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	ip, #6528
	mov	r0, #1
	mov	r2, #0
	ldr	r1, .L12+24
	ldr	r3, .L12+28
	strh	ip, [r5, #10]	@ movhi
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
	.word	100714496
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
	ands	r4, r3, #8
	beq	.L20
.L14:
	pop	{r4, lr}
	bx	lr
.L20:
	bl	goToStart
	mov	r3, r4
	ldr	r2, .L21+12
	ldr	r1, .L21+16
	ldr	r0, .L21+20
	ldr	r4, .L21+24
	mov	lr, pc
	bx	r4
	ldr	r4, .L21+28
	mov	r3, #1
	ldr	r2, .L21+12
	ldr	r1, .L21+32
	ldr	r0, .L21+36
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	bx	lr
.L22:
	.align	2
.L21:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	11025
	.word	13009
	.word	StartSFX
	.word	playSoundA
	.word	playSoundB
	.word	2335780
	.word	InstructionsSong
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
	ldr	r4, .L25
	strh	r2, [r5]	@ movhi
	mov	r3, #4608
	mov	r2, #100663296
	ldr	r1, .L25+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L25+8
	ldr	r1, .L25+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L25+16
	mov	r3, #256
	strh	r2, [r5, #8]	@ movhi
	ldr	r1, .L25+20
	mov	r2, #83886080
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2912
	ldr	r2, .L25+24
	ldr	r1, .L25+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #2048
	ldr	r2, .L25+32
	ldr	r1, .L25+36
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r2, .L25+40
	mov	r3, #256
	strh	r2, [r5, #14]	@ movhi
	ldr	r1, .L25+44
	ldr	r2, .L25+48
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #16384
	ldr	r2, .L25+52
	ldr	r1, .L25+56
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L25+60
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L26:
	.align	2
.L25:
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
	ldr	r4, .L34+24
	mov	r3, #1
	ldr	r2, .L34+28
	ldr	r1, .L34+32
	ldr	r0, .L34+36
	mov	lr, pc
	bx	r4
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
	.word	playSoundB
	.word	11025
	.word	1038906
	.word	GameSong
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
	mov	r2, #512
	ldr	r4, .L38+4
	strh	r2, [r5]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L38+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L38+12
	mov	r2, #100663296
	ldr	r1, .L38+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L38+20
	ldr	r1, .L38+24
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r1, #6528
	mov	r2, #3
	ldr	r3, .L38+28
	strh	r1, [r5, #10]	@ movhi
	str	r2, [r3]
	pop	{r4, r5, r6, lr}
	bx	lr
.L39:
	.align	2
.L38:
	.word	waitForVBlank
	.word	DMANow
	.word	pausePal
	.word	19232
	.word	pauseTiles
	.word	100714496
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
	ldr	r3, .L52+12
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame
.L51:
	ldr	r3, .L52+16
	mov	lr, pc
	bx	r3
	ldr	r4, .L52+20
	mov	r3, #1
	ldr	r2, .L52+24
	ldr	r1, .L52+28
	ldr	r0, .L52+32
	mov	lr, pc
	bx	r4
	pop	{r4, lr}
	b	goToMenu
.L53:
	.align	2
.L52:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	unpauseSound
	.word	stopSound
	.word	playSoundB
	.word	11025
	.word	724937
	.word	MenuSong
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
	mov	r2, #512
	ldr	r4, .L56+4
	strh	r2, [r5]	@ movhi
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L56+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L56+12
	mov	r2, #100663296
	ldr	r1, .L56+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r0, #3
	mov	r3, #1024
	ldr	r2, .L56+20
	ldr	r1, .L56+24
	mov	lr, pc
	bx	r4
	mov	r3, #5248
	mov	r1, #4
	ldr	r2, .L56+28
	strh	r3, [r5, #10]	@ movhi
	ldr	r3, .L56+32
	str	r1, [r2]
	ldr	r4, .L56+36
	mov	lr, pc
	bx	r3
	mov	r3, #1
	ldr	r2, .L56+40
	ldr	r1, .L56+44
	ldr	r0, .L56+48
	mov	lr, pc
	bx	r4
	pop	{r4, r5, r6, lr}
	bx	lr
.L57:
	.align	2
.L56:
	.word	waitForVBlank
	.word	DMANow
	.word	losePal
	.word	15712
	.word	loseTiles
	.word	100704256
	.word	loseMap
	.word	state
	.word	stopSound
	.word	playSoundB
	.word	11025
	.word	2116997
	.word	LoseSong
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
	ldr	r3, .L67+16
	mov	lr, pc
	bx	r3
	bl	goToPause
	b	.L59
.L68:
	.align	2
.L67:
	.word	updateGame
	.word	oldButtons
	.word	buttons
	.word	hasLost
	.word	pauseSound
	.size	game, .-game
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
	ldr	r3, .L84
	mov	lr, pc
	bx	r3
	ldr	fp, .L84+4
	ldr	r3, .L84+8
	ldr	r6, .L84+12
	mov	lr, pc
	bx	r3
	ldr	r3, .L84+16
	mov	lr, pc
	bx	r3
	ldr	r5, .L84+20
	ldr	r10, .L84+24
	ldrh	r1, [fp]
	ldr	r2, [r6]
	ldr	r9, .L84+28
	ldr	r8, .L84+32
	ldr	r7, .L84+36
	ldr	r4, .L84+40
.L70:
	strh	r1, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L81
.L74:
	.word	.L78
	.word	.L77
	.word	.L76
	.word	.L75
	.word	.L73
.L75:
	mov	lr, pc
	bx	r7
	ldrh	r1, [fp]
	ldr	r2, [r6]
	b	.L70
.L76:
	mov	lr, pc
	bx	r8
	ldrh	r1, [fp]
	ldr	r2, [r6]
	b	.L70
.L77:
	mov	lr, pc
	bx	r9
	ldrh	r1, [fp]
	ldr	r2, [r6]
	b	.L70
.L78:
	mov	lr, pc
	bx	r10
	ldrh	r1, [fp]
	ldr	r2, [r6]
	b	.L70
.L80:
	strh	r3, [r5]	@ movhi
	ldrh	r2, [r4, #48]
	mov	r1, r3
	mov	r3, r2
	strh	r2, [fp]	@ movhi
.L73:
	tst	r1, #8
	beq	.L80
	tst	r3, #8
	bne	.L80
	ldr	r3, .L84+16
	mov	lr, pc
	bx	r3
	ldrh	r1, [fp]
	ldr	r2, [r6]
	b	.L70
.L81:
	mov	r1, r3
	b	.L70
.L85:
	.align	2
.L84:
	.word	setupSounds
	.word	buttons
	.word	setupSoundInterrupts
	.word	state
	.word	goToMenu
	.word	oldButtons
	.word	menu
	.word	start
	.word	game
	.word	pause
	.word	67109120
	.size	main, .-main
	.text
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
	@ link register save eliminated.
	ldr	r3, .L91
	ldrh	r3, [r3]
	tst	r3, #8
	bxeq	lr
	ldr	r3, .L91+4
	ldrh	r3, [r3]
	tst	r3, #8
	bxne	lr
	b	goToMenu
.L92:
	.align	2
.L91:
	.word	oldButtons
	.word	buttons
	.size	lose, .-lose
	.comm	seed,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.comm	shadowOAM,1024,4
	.comm	soundB,32,4
	.comm	soundA,32,4
	.ident	"GCC: (devkitARM release 50) 8.2.0"
